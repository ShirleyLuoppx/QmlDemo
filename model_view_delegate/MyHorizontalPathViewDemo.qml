import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

//终于懂拉，自己也写了一个PathView例子
Item {
    id:root
    width: 800
    height: 400

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
    }
}
