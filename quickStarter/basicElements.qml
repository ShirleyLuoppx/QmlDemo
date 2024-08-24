import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../"

Rectangle{
    id:root
    width: 800
    height: 800
    color: "transparent"
    border.color: "lightPink"
    border.width: 10
    radius: 10

    MouseArea{
        anchors.fill: parent
        onClicked: {
            transformx.x = 20
            transformRotate.rotation = 0
            transformScale.rotation = 0
            transformScale.scale = 1
        }
    }

    /////////////////////////basic elements////////////////////
    Rectangle{
        id:gradientRect
        width: 100
        height: 100
        gradient: Gradient{
            GradientStop{position: 0; color: "pink" }//顶
            GradientStop{position: 1; color: "black" }//底
        }
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("click gradientRect ...")
            }
        }
    }

    Text {
        id: text
        text: qsTr("大鹏一跃随风起，扶摇直上九万里。")
        // font.family: ubuntu //这种字体就是默认字体
        font.pixelSize: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.bold: true //加粗
        font.italic: true //斜体
        font.letterSpacing: 20 //字间距
        style: Text.Outline//Text.Normal - the default ;Text.Outline 超级加粗，还有点立体的感觉 ;Text.Raised 加粗 ;Text.Sunken 加粗
        styleColor: '#FF4444' //配合Outline使用，文字外边颜色
        verticalAlignment: Text.AlignTop
    }

    Text {
        id: text1
        text: qsTr("大鹏一跃随风起，扶摇直上九万里。")
        font.pixelSize: 20
        anchors.top: text.bottom
        anchors.topMargin: 20
        anchors.left: text.left
    }

    Text {
        id: textChangeValue
        text: qsTr("click this change text value")
        font.pixelSize: 20
        anchors.left: text1.left
        anchors.top: text1.bottom
        anchors.topMargin: 20

        MouseArea{
            anchors.fill: parent
            onClicked: {
                text1.text = "clicked !!!"
            }
        }
    }



    /////////////////////////simple transformations////////////////////

    Rectangle{
        id:simpleTransformationRect
        width: parent.width
        height: 200
        color: "transparent"



        Rectangle{
            id:rect1
            width: 200
            height: 200
            color: "transparent"
            x:20
            y:100
            z:2//Z值控制堆叠顺序，默认为0，但是qml中后编写的控件比先编写的控件z值更高；如果想手动修改Z值，那么Z值越大越在上层

            MyClickableImage{
                id:transformx
                source: "../imagine-assets/sofa.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        transformx.x+=50
                    }
                }
            }
        }

        Rectangle{
            id:rect2
            width: 200
            height: 200
            color: "transparent"
            anchors.left: rect1.right
            anchors.leftMargin: 20
            anchors.top: rect1.top
            z:0

            MyClickableImage{
                id:transformRotate
                source: "../imagine-assets/sofa.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: transformRotate.rotation+=10
                }
            }
        }

        Rectangle{
            width: 200
            height: 200
            color: "transparent"
            anchors.left: rect2.right
            anchors.leftMargin: 20
            anchors.top: rect2.top

            MyClickableImage{
                id:transformScale
                source: "../imagine-assets/sofa.png"
                smooth: true//抗锯齿，感觉没啥用

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        transformScale.rotation+=10
                        transformScale.scale+=0.2
                    }
                }
            }
        }
    }

    /////////////////////////position elements：Row，Column，Grid，Flow////////////////////

    Rectangle{
        id:positionElementsRect
        width: parent.width
        height: 300
        color: "transparent"
        anchors.top: simpleTransformationRect.bottom
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 20

        //行
        Row{
            id:row
            spacing: 5

            RedSquare{}
            BlueSquare{}
            GreenSquare{}
            layoutDirection: Qt.RightToLeft //布局方向，默认从左到右
        }

        //列
        Column{
            id:colum
            anchors.left: row.right
            anchors.leftMargin: 20
            spacing: 5

            RedSquare{}
            GreenSquare{}
            BlueSquare{}
        }

        Grid{
            id:grid
            anchors.left: colum.right
            anchors.leftMargin: 20
            rows: 3
            columns: 3
            spacing: 5

            RedSquare{}
            GreenSquare{}
            BlueSquare{}
            RedSquare{}
            GreenSquare{}
            BlueSquare{}
            RedSquare{}
            GreenSquare{}
            BlueSquare{}
        }

        Flow{
            id:flow
            width: 200
            spacing: 5
            anchors.left: grid.right
            anchors.leftMargin: 20

            RedSquare{}
            GreenSquare{}
            BlueSquare{}
        }

        Grid{
            id:repeaterGrid
            width: parent.width
            height: 200
            anchors.top: grid.bottom
            anchors.topMargin: 20
            spacing: 2

            Repeater{
                model: 16

                Rectangle{
                    property int colorIndex: Math.floor(Math.random()*3)
                    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]

                    width: 48
                    height: 48
                    color: colorArray[colorIndex]

                    Text {
                        text: "cell"+index
                        anchors.centerIn: parent
                    }
                }
            }
        }

    }

    /////////////////////////input elements////////////////////
    Rectangle{
        id:inputRect
        width: parent.width
        height: 100
        anchors.top: positionElementsRect.bottom
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 20

        TextInput{
            id:input1
            width: 200
            height: 50
            // focus: true
            text: "input1"
            KeyNavigation.tab: greenSquareKeyAction  //KeyNavigation：按下键盘上的Tab键的时候，焦点会切换到input2
        }

        TextInput{
            id:input2
            width: 200
            height: 50
            // focus: true
            anchors.left: input1.right
            anchors.leftMargin: 20
            text: "input2"
            KeyNavigation.tab: input1
        }

        FocusScopeTextEdit{
            id:myEdit
            text: "edit text"
            // focus: true
            width: 100
            height: 100
            anchors.left: input2.right
            anchors.leftMargin: 20
        }

        GreenSquare{
            id:greenSquareKeyAction
            color: "pink"
            x:600
            y:0
            focus: true
            Keys.onLeftPressed: greenSquareKeyAction.x-=5
            Keys.onRightPressed: greenSquareKeyAction.x+=5
            Keys.onUpPressed: greenSquareKeyAction.y-=5
            Keys.onDownPressed: greenSquareKeyAction.y+=5


            Keys.onPressed: {
                switch(event.key){
                case Qt.Key_Plus:greenSquareKeyAction.scale+=0.1
                    break;
                case Qt.Key_Minus:greenSquareKeyAction.scale-=0.1
                    break
                }
            }
        }
    }
}
