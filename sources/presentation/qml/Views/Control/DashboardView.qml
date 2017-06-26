import QtQuick 2.6
import QtQuick.Layouts 1.3

ColumnLayout {
    id: root

    property var instruments

    signal instrumentAdded(string name, QtObject view)

    spacing: palette.spacing

    Repeater {
        model: instruments

        Loader {
            Layout.fillWidth: true
            sourceComponent: createIndicator(modelData)
            onItemChanged: if (item) instrumentAdded(modelData, item)
        }
    }

    Item { Layout.fillHeight: true }

    function createIndicator(modelData) {
        switch (modelData) {
        case "satellite": return Qt.createComponent("Displays/SatelliteDisplay.qml");
        case "fd": return Qt.createComponent("Displays/FlightDisplay.qml");
        case "nav": return Qt.createComponent("Displays/NavigationDisplay.qml");
        case "status": return Qt.createComponent("Displays/StatusDisplay.qml");
        case "command": return Qt.createComponent("Displays/CommandDisplay.qml");
        default: return null
        }
    }
}
