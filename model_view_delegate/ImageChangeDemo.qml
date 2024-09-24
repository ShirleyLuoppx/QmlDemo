import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

//https://blog.csdn.net/zhuhan1047026029/article/details/127063987
Window {
    width: 1024
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: listModel
        ListElement {
            name: "Bill Jones"
            color: "lightblue"
        }
        ListElement {
            name: "Jane Doe"
            color:"lightgray"
        }
        ListElement {
            name: "John Smith"
            color:"lightgreen"
        }
        ListElement {
            name: "Bill Jones"
            color: "brown"
        }
        ListElement {
            name: "Jane Doe"
            color:"orange"
        }
        ListElement {
            name: "John Smith"
            color:"purple"
        }
    }

    Rectangle {
        id: rect
        width: 700; height: 200
        anchors.centerIn: parent

        Component {
            id: delegate
            Rectangle {
                id: wrapper
                scale: PathView.iconScale
                width: 200
                height: 200
                color: model.color
                z: PathView.iconZ        //这里的z坐标需要变换，否则可能当前项会被其他项挡住
                opacity: PathView.iconOpacity
                MouseArea{
                    anchors.fill: parent
                    onClicked: pathView.currentIndex = index
                }
            }
        }

        PathView {
            id: pathView
            anchors.fill: parent
            model: listModel
            delegate: delegate
            pathItemCount: 6
            property real vcenter: 300
            highlightMoveDuration: 300
            maximumFlickVelocity:30
            interactive: false
            path:
                Path {
                startX: 350; startY: 100//启动位置
                //选中项的属性
                PathAttribute { name: "iconScale"; value: 1.0;  }
                PathAttribute { name: "iconOpacity"; value: 1.0 }
                PathAttribute { name: "iconZ"; value: 1.0 }
                PathQuad { x: 350; y: 100; controlX: 650; controlY: 100 }
                //非选中项属性
                PathAttribute { name: "iconScale"; value: 0.7 }
                PathAttribute { name: "iconOpacity"; value: 1.0 }
                PathAttribute { name: "iconZ"; value: 0.0 }
                PathQuad { x: 350; y: 100; controlX: 50; controlY: 100 }
            }
        }
    }

    Button{
        text: "<"
        anchors.right: rect.left
        anchors.verticalCenter: rect.verticalCenter
        onClicked: pathView.decrementCurrentIndex()
    }
    Button{
        text: ">"
        anchors.left: rect.right
        anchors.verticalCenter: rect.verticalCenter
        onClicked: pathView.incrementCurrentIndex()
    }

}
