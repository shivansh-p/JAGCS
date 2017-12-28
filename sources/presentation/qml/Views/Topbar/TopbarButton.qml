import QtQuick 2.6
import JAGCS 1.0

import "qrc:/Controls" as Controls

Rectangle {
    id: control

    property real iconScaling: 0.6
    property string tipText
    property url entry
    readonly property bool activeEntry: entry == menu.currentContext

    property alias iconSource: icon.source
    property alias iconColor: icon.color

    implicitWidth: sizings.controlBaseSize
    implicitHeight: sizings.controlBaseSize
    radius: 3
    color: area.pressed ? palette.highlightColor : "transparent"

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: sizings.controlBaseSize / 8
        color: palette.selectionColor
        visible: activeEntry
    }

    Controls.ColoredIcon {
        id: icon
        color: activeEntry ? palette.selectionColor : palette.textColor
        anchors.centerIn: parent
        width: parent.width * iconScaling
        height: width
    }

    MouseArea {
        id: area
        hoverEnabled: true
        anchors.fill: parent
        onClicked: if (!activeEntry) menu.goTo(entry, tipText, {})
    }

    Controls.ToolTip {
        visible: (area.pressed || area.containsMouse) && tipText
        text: tipText
        delay: 1000
    }
}

/*
Controls.Button {
    iconSource: "qrc:/icons/settings.svg"
    flat: true
    tipText: qsTr("Vehicles")
    onClicked: menu.goTo("Vehicles/VehicleListView.qml", tipText, {})
}
*/
