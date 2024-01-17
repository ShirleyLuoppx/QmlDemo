import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Rectangle {

    id: page

    width: 360

    height: 640
    Flickable {

        id: flickable1

        anchors.fill: parent

        contentWidth: column.width

        contentHeight: column.height



        Column {

            id: column

            spacing: 100



            Rectangle {

                id: rectangle1

                x: 9

                width: 280

                height: 100

                color: "#00000000"

                border.color: "#000000"



                Rectangle {

                    id: myLine

                    x: 0

                    y: 59

                    width: rectangle1.width

                    height: 1

                    color: "red"

                }

            }

            Text {

                id: text1

                text: "text11"

                font.pixelSize: 24

            }

            Text {

                id: text2

                text: "text12"

                font.pixelSize: 24

            }

            Text {

                id: text3

                text: "text13"

                font.pixelSize: 24

            }

            Text {

                id: text4

                text: "text14"

                font.pixelSize: 24

            }

            Text {

                id: text5

                text: "text15"

                font.pixelSize: 24

            }

            Text {

                id: text6

                text: "text16"

                font.pixelSize: 24

            }

            Text {

                id: text7

                text: "text17"

                font.pixelSize: 24

            }

        }

    }



    // 滚动条

    Rectangle {

        id: scrollbar

        x: 350

        y: 0

        width: 20

        height: 640

        color: "black"



        // 按钮

        Rectangle {

            id: button

            x: 0

            y: flickable1.visibleArea.yPosition * scrollbar.height

            width: 20

            height: flickable1.visibleArea.heightRatio * scrollbar.height;

            color: "green"



            // 鼠标区域

            MouseArea {

                id: mouseArea

                anchors.fill: button

                drag.target: button

                drag.axis: Drag.YAxis

                drag.minimumY: 0

                drag.maximumY: scrollbar.height - button.height



                // 拖动

                onMouseYChanged: {

                    flickable1.contentY = button.y / scrollbar.height * flickable1.contentHeight

                }

            }

        }

    }

}
