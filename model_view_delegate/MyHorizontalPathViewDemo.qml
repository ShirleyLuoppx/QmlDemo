import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

//终于懂拉，自己也写了一个PathView例子
Item {
    id:root
    width: 800
    height: 400

    Rectangle{
        id:rect1
        width: parent.width
        height: 100
        Component{
            id:mdelegate

            Rectangle{
                width: 60
                height: 60
                color: Qt.rgba(Math.random(1),Math.random(1),Math.random(1),1)
                z:PathView.itemZ
                scale: PathView.itemScale
                opacity: PathView.itemAlpha

                Text{
                    text: index
                    anchors.centerIn: parent
                    font.pixelSize: 25
                }
            }
        }

        PathView{
            anchors.fill: parent
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            highlightRangeMode: PathView.StrictlyEnforceRange
            interactive: true
            pathItemCount: 15
            delegate: mdelegate
            model: 15

            path: Path{
                startX: 10
                startY: 50
                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
                PathAttribute{name:"itemScale" ; value:0.6}
                PathLine{x:300 ; y:50}

                PathAttribute{name:"itemZ" ; value:1}
                PathAttribute{name:"itemAlpha" ; value:1}
                PathAttribute{name:"itemScale" ; value:1.2}
                PathLine{x:600 ; y:50}

                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
                PathAttribute{name:"itemScale" ; value:0.6}
            }

            focus: true
            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()

            MouseArea{}
        }
    }

    Rectangle{
        id:rect2
        width: parent.width
        height: 100
        anchors.top: rect1.bottom
        Component{
            id:mAvgdelegate

            Rectangle{
                width: 60
                height: 60
                color: Qt.rgba(Math.random(1),Math.random(1),Math.random(1),1)
                z:PathView.itemZ
                opacity: PathView.itemAlpha

                Text{
                    text: index
                    anchors.centerIn: parent
                    font.pixelSize: 25
                }
            }
        }

        PathView{
            anchors.fill: parent
            preferredHighlightBegin: 0.4
            preferredHighlightEnd: 0.6
            highlightRangeMode: PathView.StrictlyEnforceRange
            interactive: true
            pathItemCount: 7
            delegate: mAvgdelegate
            model: 15

            path: Path{
                startX: 10
                startY: 70
                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1} ///去掉scale的属性值变化就变成了均分的
                PathLine{x:300 ; y:70}

                PathAttribute{name:"itemZ" ; value:1}
                PathAttribute{name:"itemAlpha" ; value:1}
                PathLine{x:600 ; y:70}

                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
            }
        }
    }

    //类似电台的滑动条那种，但是需要选中刻度才能滑动，所以还是不能选择这种方式去做滑动条，应该还是用listview更合适一点
    Rectangle{
        id:rect3
        width: parent.width
        height: 100
        anchors.top: rect2.bottom
        Component{
            id:mAvgdelegate2

            Rectangle{
                width: 5
                height: 60
                color: "black"
            }
        }

        PathView{
            anchors.fill: parent
            interactive: true
            pathItemCount: 50
            delegate: mAvgdelegate2
            model: 150

            path: Path{
                startX: 50
                startY: 120
                PathLine{x:600 ; y:120}
            }
            focus: true
        }
    }
}
