import QtQuick 2.15

Item {
    id:root
    width: 300
    height: 500


    ListView{
        id:lv
        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: mModel
        delegate: mDelegate
    }

    ListModel{
        id:mModel
        ListElement{name:"可惜不是你";image:"../imagine-assets/01.png";fact:"但闭上我双眼我还看得见，可是不是你，陪我到最后，曾一起走却走失那路口，感谢那是你，牵过我的手，还能感受那温柔~"}
        ListElement{name:"可惜不是你";image:"../imagine-assets/pic03.jpg";fact:"但闭上我双眼我还看得见，可是不是你，陪我到最后，曾一起走却走失那路口，感谢那是你，牵过我的手，还能感受那温柔~"}
        ListElement{name:"可惜不是你";image:"../imagine-assets/sofa.png";fact:"但闭上我双眼我还看得见，可是不是你，陪我到最后，曾一起走却走失那路口，感谢那是你，牵过我的手，还能感受那温柔~"}
        ListElement{name:"可惜不是你";image:"../imagine-assets/01.png";fact:"但闭上我双眼我还看得见，可是不是你，陪我到最后，曾一起走却走失那路口，感谢那是你，牵过我的手，还能感受那温柔~"}
    }

    //mDelegate 不能直接用Rectangle包起来，要不然Rectangle里面的内容识别不到model的参数；只能用Component包起来？
    Component{
        id:mDelegate

        Rectangle{
            id:wrapper
            width: root.width
            height: 50
            color: "lightyellow"

            Text {
                id: txName
                width: 100
                text: name
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 10
                font.pixelSize: 20
            }

            Image {
                id: igImage
                source: image
                width: wrapper.height
                height: wrapper.height
                fillMode: Image.PreserveAspectFit
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            Rectangle{
                id:rectFact
                anchors.top: igImage.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                opacity: 0
                width: parent.width
                color: "gray"
                Text {
                    id: txFact
                    text: fact
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    wrapper.state = "expand"
                }
            }

            Rectangle{
                id:rectClose
                width: 50
                height: 50
                color: "black"
                anchors.right: parent.right
                anchors.rightMargin: 10
                opacity: 0

                //如果这个鼠标点击事件放在wrapper的点击事件之前，那么这里就会收不到点击事件，应该是跟事件传递有关系，点击事件一层层传递，直到传给最后一个接收地；
                //所以需要把关闭按钮的点击事件放在最后面才能接收到点击事件
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        wrapper.state = ""
                    }
                }
            }

            states: [
                State {
                    name: "expand"
                    PropertyChanges{
                        target: wrapper;height:lv.height
                    }
                    PropertyChanges {
                        target:igImage; height:lv.width; width:lv.width; anchors.rightMargin: 0; anchors.topMargin: 50;
                    }
                    PropertyChanges{
                        target: rectClose; opacity:1
                    }
                    PropertyChanges{
                        target: rectFact; opacity:1
                    }
                    PropertyChanges {
                        target: wrapper.ListView.view; contentY: wrapper.y; interactive: false
                    }
                }
            ]

            transitions: [
                Transition {
                    NumberAnimation{
                        duration: 250
                        properties: "height,width,anchors.topMargin,opacity,contentY,interactive,anchors.rightMargin"
                    }

                }
            ]
        }

    }
}
