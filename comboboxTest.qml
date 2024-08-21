import QtQuick 2.15
import QtQuick.Controls 2.15

/// 自定义一个下拉选择框
Rectangle{
    id:root
    width: 200
    height: 300
    color: "#00000000"

    property variant contentList: ["舒适模式","智能模式","清洁模式"]
    property int currentHoverIndex: -1
    property int currentSelectedIndex: -1
    property string defaultContent: "情景模式"
    property bool popupWindowVisiable: false
    property string downArrowPath: "./imagine-assets/ic_scenario_mode_down.png"
    property string selectedTextColor: "black"

    signal selectIndexChanged(int selectIndex)

    Rectangle{
        id:selectTextRect
        width: parent.width
        height: 60
        color: "#00000000"

        Image {
            id: downArrow
            source: downArrowPath
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 27
        }

        Text {
            id: selectText
            text: defaultContent
            font.pixelSize: 23
            color: selectedTextColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: downArrow.right
            anchors.leftMargin: 15
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("click show content...")
                if(popupWindowVisiable){
                    popupWindowVisiable = false
                    downArrowPath = "./imagine-assets/ic_scenario_mode_down.png"
                }else{
                    popupWindowVisiable = true
                    downArrowPath = "./imagine-assets/ic_scenario_mode_up.png"
                }
                contentListRect.visible = popupWindowVisiable
            }
        }
    }

    Rectangle{
        id:contentListRect
        width: parent.width
        height: parent.height-selectTextRect.height
        color: "#00000000"
        anchors.top: selectTextRect.bottom
        visible: popupWindowVisiable

        Column{
            id:column
            width: parent.width
            height: parent.height

            Repeater{
                model: contentList.length

                Rectangle{
                    id:contentRect
                    width: parent.width
                    height: 60
                    color: "#00000000"

                    Text {
                        id: content
                        text: contentList[index]
                        font.pixelSize: 23
                        color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 66
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            console.log("hover ing index = "+index)
                            contentRect.color = "#D9D9D9"
                        }
                        onExited: {
                            console.log("exites index = "+index)
                            contentRect.color = "#00000000"
                        }
                        onClicked: {
                            console.log("click index = "+index)
                            currentSelectedIndex = index
                            selectText.text = contentList[index]

                            selectIndexChanged(currentSelectedIndex)

                            popupWindowVisiable = false
                            downArrowPath = "./imagine-assets/ic_scenario_mode_down.png"
                            contentListRect.visible = popupWindowVisiable
                        }
                    }
                }
            }
        }
    }
}
