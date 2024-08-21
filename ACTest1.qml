import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id:root
    width: 1280
    height: 720
    color: "#00000000"

    property var imgList : ["./imagine-assets/blowhead0.png","./imagine-assets/blowhead1.png",
        "./imagine-assets/blowhead2.png","./imagine-assets/blowhead3.png",
        "./imagine-assets/blowhead4.png","./imagine-assets/blowhead5.png",
        "./imagine-assets/blowhead6.png","./imagine-assets/blowhead7.png",]
    property int flag: 0

    Rectangle{
        id:tetRect
        width: 100
        height: 100
        color: "lightpink"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("click test rect ... timer.running = "+timer.running+"---flag = " + flag)
                timer.running = !timer.running
            }
        }
    }

    Image {
        id: img
        source: "./imagine-assets/blowhead0.png"
    }

    Timer{
        id:timer
        interval: 100
        repeat: true
        running: false
        onTriggered: {
            if(flag==8){
                flag=0
            }
            img.source = imgList[flag]
            flag++
        }
    }
}
