import QtQuick 2.6
import QtQuick.Layouts 1.3
import JAGCS 1.0

import "qrc:/Controls" as Controls
import "../"

TopbarButton {
    id: connection

    property int count: 0
    property var messages: []

    function logAdded(message) {
        if (notificator.visible) {
            messages.push(message);
            count = messages.length;
        }
        else {
            notificator.show(message);
        }
    }

    tipText: qsTr("Logbook")
    iconSource: "qrc:/icons/notify.svg"
    iconColor: enabled ? palette.textColor : palette.sunkenColor;
    entry: "../../Menu/Log/LogListView.qml"

    NotificationsPresenter {
        id: presenter
        view: connection
    }

    Connections {
        target: notificator
        onDropped: {
            if (messages.length > 0) notificator.show(messages.pop());
            count = messages.length;
        }
    }

    Text {
        anchors.centerIn: parent
        color: parent.iconColor
        font.pixelSize: sizings.fontPixelSize * 0.6
        text: count
    }
}