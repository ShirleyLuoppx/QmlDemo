import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

/// 动画相关

////////////////// 常用的动画 //////////////////
// PropertyAnimation（属性动画）- 使用属性值改变播放的动画

// NumberAnimation（数字动画）- 使用数字改变播放的动画

// ColorAnimation（颜色动画）- 使用颜色改变播放的动画

// RotationAnimation（旋转动画）- 使用旋转改变播放的动画

////////////////// 特殊场景下使用的动画  ////////////////
// PauseAnimation（停止动画）- 运行暂停一个动画

// SequentialAnimation（顺序动画）- 允许动画有序播放

// ParallelAnimation（并行动画）- 允许动画同时播放

// AnchorAnimation（锚定动画）- 使用锚定改变播放的动画

// ParentAnimation（父元素动画）- 使用父对象改变播放的动画

// SmotthedAnimation（平滑动画）- 跟踪一个平滑值播放的动画

// SpringAnimation（弹簧动画）- 跟踪一个弹簧变换的值播放的动画

// PathAnimation（路径动画）- 跟踪一个元素对象的路径的动画

// Vector3dAnimation（3D容器动画）- 使用QVector3d值改变播放的动画

Rectangle{
    id:root
    width: 800
    height: 800
    color: "transparent"

    MouseArea{
        anchors.fill: parent
        onClicked: {
            image1.y = 0
            image2.y = 0
            image3.y = 0
            image4.y = 0
        }
    }

    Image {
        id: igAnimation
        x:0
        y:0
        width: 200
        height: 200
        fillMode: Image.PreserveAspectFit //按比例缩放，不裁剪
        source: "../imagine-assets/01.png"

        NumberAnimation on x{ //NumberAnimation:数值动画
            to: 300
            duration: 1000
            loops: Animation.Infinite //这个无限循环，不是我想象得那种无限循环....
        }

        RotationAnimation on rotation {
            to: 360
            duration: 1000
        }
    }

    ClickableImageV2{
        id:image1
        source: "../imagine-assets/01.png"
        text: "NumberAnimation"

        NumberAnimation on y{
            to: 200
            duration: 2000
        }
    }

    ClickableImageV2{
        id:image2
        anchors.left: image1.right
        anchors.leftMargin: 20
        source: "../imagine-assets/01.png"
        text: "Behavior"

        Behavior on y{
            NumberAnimation {duration: 2000}
        }

        //需要点击事件来触发动画
        onClicked: y=200
    }

    ClickableImageV2{
        id:image3
        source: "../imagine-assets/01.png"
        text: "NumberAnimation satrt()"
        anchors.left: image2.right
        anchors.leftMargin: 20

        onClicked: numberAnimation.start()

        NumberAnimation{
            id:numberAnimation
            target: image3
            duration: 2000
            property: "y"
            from: 0
            to: 200
        }
    }

    ClickableImageV2{
        id:image4
        source: "../imagine-assets/01.png"
        text: "NumberAnimation on y running"
        anchors.left: image3.right
        anchors.leftMargin: 20
        NumberAnimation on y{
            to: 200
            duration: 2000
            running: area.pressed()
        }

        MouseArea{
            id:area
        }
    }


}
