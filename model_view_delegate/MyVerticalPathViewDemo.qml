import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

Item {
    id:root
    width: 800
    height: 400

    Rectangle{
        id:rect1
        width: 160
        height: parent.height
        color: "lightpink"

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
                startX: 50
                startY: 20
                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
                PathAttribute{name:"itemScale" ; value:0.6}
                PathLine{x:50 ; y:200}

                PathAttribute{name:"itemZ" ; value:1}
                PathAttribute{name:"itemAlpha" ; value:1}
                PathAttribute{name:"itemScale" ; value:1.2}
                PathLine{x:50 ; y:380}

                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
                PathAttribute{name:"itemScale" ; value:0.6}
            }

            focus: true //如果滑不动，请给rectangle加背景色，确认pathview是否在rectangle里面
            Keys.onUpPressed: decrementCurrentIndex()
            Keys.onDownPressed: incrementCurrentIndex()
        }
    }

    Rectangle{
        id:rect2
        width: 160
        height: parent.height
        anchors.left: rect1.right
        anchors.leftMargin: 100
        color: "lightgray"

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
            pathItemCount: 5
            delegate: mAvgdelegate
            model: 15

            path: Path{
                startX: 100
                startY: 20
                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1} ///去掉scale的属性值变化就变成了均分的
                PathLine{x:100 ; y:200}

                PathAttribute{name:"itemZ" ; value:1}
                PathAttribute{name:"itemAlpha" ; value:1}
                PathLine{x:100 ; y:380}

                PathAttribute{name:"itemZ" ; value:0.1}
                PathAttribute{name:"itemAlpha" ; value:0.1}
            }
        }
    }
}
