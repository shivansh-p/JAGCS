import QtQuick 2.6
import QtQuick.Layouts 1.3

import "qrc:/Controls" as Controls

ColumnLayout {
    id: root

    spacing: sizings.spacing

    Item {
        Layout.fillHeight: true
    }

    Controls.Button {
        iconSource: "qrc:/ui/plus.svg"
        tipText: qsTr("Zoom in")
        visible: map.visible
        autoRepeat: true
        onClicked: map.zoomLevel++
    }

    Controls.Button {
        iconSource: "qrc:/ui/minus.svg"
        tipText: qsTr("Zoom out")
        visible: map.visible
        autoRepeat: true
        onClicked: map.zoomLevel--
    }

    Controls.Button {
        id: cancelTrackButton
        tipText: qsTr("Cancel track")
        iconSource: "qrc:/icons/cancel_track.svg"
        visible: map.trackingVehicleId != 0
        onClicked: map.trackingVehicleId = 0
    }

    Controls.Button {
        tipText: qsTr("North")
        iconSource: "qrc:/icons/compas.svg"
        onClicked: bearingAnimation.start()
        enabled: !map.trackYaw
        visible: map.visible

        RotationAnimation {
            id: bearingAnimation
            target: map
            properties: "bearing"
            to: 0
            duration: 200
            direction: RotationAnimation.Shortest
        }
    }

    Controls.Button {
        id: maxMinButton
        tipText: cornerVisible ? qsTr("Hide window") : qsTr("Show window")
        iconSource: cornerVisible ? "qrc:/icons/hide_window.svg" :
                                    "qrc:/icons/show_window.svg"
        onClicked: cornerVisible = !cornerVisible
    }
}
