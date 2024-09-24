import QtQuick 2.15

Item {
    id:root
    width: 800
    height: 500

    Rectangle{
        width: parent.width
        height: parent.height
        color: "white"

        Path{
            startX: 0       //路径起点的x坐标，界面左上角是(0，0)
            startY: 0       //路径起点的y坐标

            //PathLine
            PathLine{
                x:root.width
                y:root.height
            }               //画线，线的起点即是（startX,startY），本PathLine的(x,y)即是这条线的终点,同时也是作为下一个路径的起点
            //这里就是画了一条从界面左上角到界面右下角的直线的路径
        }

        //PathQuad：二次贝塞尔曲线
        Path{
            startX: 0
            startY: 0

            PathQuad{
                controlX: 0
                controlY: root.height-1
                x:root.width
                y:root.height
            }           //二次方贝塞尔路径，有一个终点，和一个控制点以及一个函数组成，我们这里只需要关注终点坐标和控制点的坐标
        }

        //PathCubic：三次贝塞尔曲线
        Path{
            startX: 0
            startY: 0

            PathCubic{
                control1X: 0;
                control1Y: root.height - 1;
                control2X: root.width - 1;
                control2Y: root.height / 2;
                x: root.width - 16;
                y: root.height - 16;
            }           //三次方贝塞尔路径，有一个终点，和2个控制点以及一个函数组成，我们这里只需要关注终点坐标和控制点的坐标
        }

        //PathArc:弧线
        Path{
            startX: 0
            startY: 100

            PathArc{
                x:100
                y:200
                radiusX: 100 //弧线的半径
                radiusY: 100 //弧线的半径
                useLargeArc: true //如果同时有两条弧线都满足所设置的值，那么使用更大的这个弧线
                direction: PathArc.Counterclockwise  //Clockwise:顺时针；Counterclockwise：逆时针
            }
        }
    }
}
