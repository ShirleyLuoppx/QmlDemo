import QtQuick 2.15

Rectangle {
    width: 500
    height: 300
    color: "white"
    ListView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 100
        delegate: numberDelegate
        spacing: 5
        highlight: highlightComponent
        focus: true
    }
    Component {
        id: highlightComponent
        Rectangle {
            width: ListView.view.width
            color: "lightGreen"
        }
    }
    Component {
        id: numberDelegate
        Item {
            width: 40
            height: 40
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}
// M1>>
