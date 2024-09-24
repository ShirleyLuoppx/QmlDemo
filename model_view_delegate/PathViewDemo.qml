import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

//PathView 官方demo :https://www.bookstack.cn/read/QmlBook-In-Chinese/model-view-delegate-advanced_techniques.md
Item {
    id: root
    width: 300
    height: 500

    PathView {
        anchors.fill: parent
        delegate: flipCardDelegate
        model: 100
        path: Path {
            startX: root.width/2 //路径起点的x坐标，界面左上角是(0，0)
            startY: 0            //路径起点的y坐标
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemAngle"; value: -90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            PathLine { x: root.width/2; y: root.height*0.4; } //画线，线的起点即是（startX,startY），本PathLine的(x,y)即是这条线的终点,同时也是作为下一个路径的起点
            PathPercent { value: 0.48; } //PathPercent前面的这部分路径上的item的数量占所有路径上item数量的比例
            PathLine { x: root.width/2; y: root.height*0.5; }
            PathAttribute { name: "itemAngle"; value: 0.0; }
            PathAttribute { name: "itemScale"; value: 1.0; }
            PathAttribute { name: "itemZ"; value: 100 }
            PathLine { x: root.width/2; y: root.height*0.6; }  //height：root.height*0.1  0.04
            PathPercent { value: 0.52; }
            PathLine { x: root.width/2; y: root.height; }
            PathAttribute { name: "itemAngle"; value: 90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            PathAttribute { name: "itemZ"; value: 0 }
        }
        pathItemCount: 16
        preferredHighlightBegin: 0.5  //首选起始位置
        preferredHighlightEnd: 0.5  //首选结束位置
        // flickDeceleration:0.1
    }

    // 在 delegate 的顶层 item 内使用 PathView.isCurrentItem 可以获知本 item 是否为 PathView 的当前 item ；
    //PathView.onPath 则可以知道本 item 是否在路径上；
    //PathView.view 则指向 item 所属的 PathView 实例，你可以通过它来访问 PathView 的方法、属性、信号等。
    Component {
        id: flipCardDelegate
        Item {
            id: wrapper
            width: 64
            height: 64
            visible: PathView.onPath   //返回布尔值：本item是否在路径上
            scale: PathView.itemScale
            z: PathView.itemZ
            property variant rotX: PathView.itemAngle
            transform: Rotation { axis { x: 1; y: 0; z: 0 } angle: wrapper.rotX; origin { x: 32; y: 32; } }
            Rectangle {
                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 3
            }
            Text {
                anchors.centerIn: parent
                text: index
                font.pixelSize: 30
            }
        }
    }
}
