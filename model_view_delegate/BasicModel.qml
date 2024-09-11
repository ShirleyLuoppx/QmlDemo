import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

//simple Repeater demo
Item{
    id:root
    width: 1000
    height: 800

    Column{
        id:numberColum
        spacing: 2

        //为什么不能列不能滚动起来呢？？？？难道Column的就是滚动不起来？ listview或者gridview的是可以滚动的
        Repeater{
            model: 30 //model 指定数量

            Rectangle{
                id:rect
                width: 100
                height: 30
                color: "skyblue"

                Text {
                    id: txt
                    text: index
                    anchors.centerIn: parent
                }
            }
        }
    }

    //numberColum1 等同于 numberColum
    Column{
        id:numberColum1
        spacing: 2
        anchors.left: numberColum.right
        anchors.leftMargin: 5

        //为什么不能列不能滚动起来呢？？？？
        Repeater{
            model: 30 //model 指定数量

            delegate: Rectangle{
                id:rect1
                width: 100
                height: 30
                color: "skyblue"

                Text {
                    id: txt1
                    text: index
                    anchors.centerIn: parent
                }
            }
        }
    }

    Column{
        id:mbyColumn
        spacing: 2
        anchors.left: numberColum1.right
        anchors.leftMargin: 5

        Repeater{
            //model 直接指定值，列的长度根据值的个数变化
            model: ["小王日记","消愁","如果有一天我变得很有钱","牧马城市","一荤一素","不染","平凡的一天","借","小王日记","消愁","如果有一天我变得很有钱","牧马城市","一荤一素","不染","平凡的一天","借"]

            Rectangle{
                width: 100
                height: 30
                color: "lightpink"

                Text {
                    elide: Text.ElideRight
                    text: modelData //modelData，表示使用model指定的值，会自动按照model中的值的顺序来排列
                    width: 100
                    anchors.centerIn: parent
                    anchors.horizontalCenter: Text.AlignHCenter
                    anchors.verticalCenter: Text.AlignVCenter
                }
            }
        }
    }

    Column{
        id:colorColumn
        spacing: 2
        anchors.left: mbyColumn.right
        anchors.leftMargin: 5

        Repeater{
            model: ListModel{
                ListElement{name:"monday"; surfaceColor :"red"}
                ListElement{name:"tuesday"; surfaceColor :"orange"}
                ListElement{name:"wendesday"; surfaceColor :"yellow"}
                ListElement{name:"thirsday"; surfaceColor :"green"}
                ListElement{name:"friday"; surfaceColor :"lightgreen"}
                ListElement{name:"saturday"; surfaceColor :"blue"}
                ListElement{name:"sunday"; surfaceColor :"purple"}
            }

            Rectangle{
                width: 100
                height: 30
                color: surfaceColor //也可以model.surfaceColor，也能识别

                Text {
                    text: name  //也可以model.name，也能识别
                    anchors.centerIn: parent
                }
            }
        }
    }


}
