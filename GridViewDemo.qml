import QtQuick 2.0

Rectangle {
    width: 600
    height: 300

    GridView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 50
        cellWidth: 55
        cellHeight: 55
        delegate: numberDelegate
    }

    Component {
        id: numberDelegate
        Rectangle {
            width: 50
            height: 50
            color: "lightGreen"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 20
                text: index
            }
        }
    }
}
