import QtQuick 2.15
import QtQuick.Controls 1.1

//本类用于将不可见的PathView路径 可视化成 Canvas
//和MyPathViewDemo.qml一同食用
Item {
    id: root
    width: 800
    height: 800

    //MyPathViewDemo-PathLine
    Canvas{
        id:line
        width: 200
        height: 200

        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(width,height);
            ctx.stroke();
        }

        Text {
            anchors.centerIn: parent;
            font.pixelSize: 20;
            text: "line";
        }
    }

    //MyPathViewDemo-PathQuad
    Canvas {
        id:quad
        width: 200;
        height: 200;
        anchors.left: line.right


        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.moveTo(16, 16);
            ctx.quadraticCurveTo(0, height-1, width, height);//类比MyPathViewDemo的PathQuad（虽然可视化了，但是还是不懂为什么是这样的一条曲线！！！没学过的哭了）
            ctx.stroke();
        }

        Text {
            anchors.centerIn: parent;
            font.pixelSize: 20;
            text: "quadraticCurveTo";
        }
    }

    //MyPathViewDemo-PathCubic
    Canvas {
        id:cubic
        width: 200;
        height: 200;
        anchors.left: quad.right

        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.moveTo(16, 16);
            ctx.bezierCurveTo(0, height - 1, width -1, height / 2, width - 16, height - 16);
            ctx.stroke();
        }

        Text {
            anchors.centerIn: parent;
            font.pixelSize: 20;
            text: "bezierCurveTo";
        }

        Rectangle {
            width: 32;
            height: 32;
            radius: 16;
            color: "blue";
            id: ball;

            MouseArea {
                anchors.fill: parent;
                id: mouseArea;
                onClicked: pathAnim.start();
            }

            PathAnimation {
                id: pathAnim;
                target: ball;
                duration: 3000;
                anchorPoint: "16,16"; //设置ball的中心点
                easing.type: Easing.InCubic;
                path: Path {
                    startX: 16;
                    startY: 16;
                    PathCubic {
                        x: cubic.width - 16;
                        y: cubic.height - 16;
                        control1X: 0;
                        control1Y: cubic.height - 1;
                        control2X: cubic.width - 1;
                        control2Y: cubic.height / 2;
                    }
                }
            }
        }
    }

    // MyPathViewDemo-PathArc
    Canvas{
        id:arc
        anchors.left: cubic.right
        width: 200
        height: 200

        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            // ctx.moveTo(16, 16);
            // arc(x, y, radius, startAngle, endAngle, anticlockwise);
            ctx.arc(0,100,100,60,180,true);
            ctx.stroke();
        }

        Text {
            anchors.centerIn: parent;
            font.pixelSize: 20;
            text: "arc";
        }
    }
}
