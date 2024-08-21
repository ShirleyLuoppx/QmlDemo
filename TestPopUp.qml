import QtQuick 2.15
import "./PopUpDemo.qml"

Rectangle {
    id:test
    width: 500
    height: 500

    Text {
        id: click
        text: "click popup"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("click popup demo .... ")
                PopUpDemo.ro
            }
        }
    }
}
