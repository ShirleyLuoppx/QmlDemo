import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../"

//缓冲曲线：就是不同的几种运动速率类型
Item {
    id:root
    width: 900
    height: 500

    //Linear匀速、InQuad匀加速、OutQuad匀减速、InOutQuad匀加速后匀减速
    //InCubic应该是变加速、
    //InElastic和InBack、InBounce 都是弹几下最后去到to x的效果
    property variant  easings : [
        "Linear", "InQuad", "OutQuad", "InOutQuad",
        "InCubic", "InSine", "InCirc", "InElastic",
        "InBack", "InBounce"
    ]

    Grid{
        id:grid
        width:parent.width
        height: parent.height
        spacing:20
        columns: 5
        rows: 2
        anchors.left: parent.left
        anchors.leftMargin: 35
        anchors.top: parent.top
        anchors.topMargin: 35

        Repeater{
            model: easings

            ClickableImageV3{
                framed: true
                text: easings[index]
                source: "../imagine-assets/01.png"
                onClicked: {
                    console.log("click "+easings[index])
                    anim.easing.type = easings[index]
                    anim.restart()
                }
            }
        }
    }

    RedSquare{
        id:square
        x:20
        y:400
    }

    NumberAnimation{
        id:anim
        target:square
        duration: 3000
        from: 20
        to: 500
        properties: "x"
    }
}
