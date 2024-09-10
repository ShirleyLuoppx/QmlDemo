import QtQuick 2.15
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        // anchors.fill: parent
        color: "white"
        width: parent.width
        height: parent.height

        Rectangle{
            id:circleA
            anchors.centerIn: parent
            width: 100
            height: 100
            radius: width/2
            color: "red"

            ColorAnimation on color {
                id:anima
                // target: circleA
                from: "red"
                to: "blue"
                duration: 2000
                running: false
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("==========-=-=-=-=-=-bb")
                    anima.running = true
                }
            }
        }
    }
}



