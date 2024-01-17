import QtQuick 2.15

Item {
    id:root
    width: 1000
    height: 500
    property int duration: 4000

    ClickableImage{
        id:img01
        x:0
        y:270
        source: "./imagine-assets/pic03.jpg"
        onClicked: sequentialAnimation.restart()
    }

    ClickableImage{
        id:img02
        x:200
        y:270
        source: "./imagine-assets/pic03.jpg"
        onClicked: parallelAnimation.restart()
    }

    //顺序动画：按照代码顺序播放动画
    SequentialAnimation{
        id:sequentialAnimation

        NumberAnimation {
            duration: root.duration
            target: img01
            properties: "y"
            from:270
            to:0
        }

        NumberAnimation {
            target: img01
            property: "x"
            from:0
            to: 700
            duration: root.duration
        }
    }

    //平行动画，所有动画一起播放
    ParallelAnimation{
        id:parallelAnimation
        NumberAnimation {
            duration: root.duration
            target: img02
            properties: "y"
            from:270
            to:0
        }

        NumberAnimation {
            target: img02
            property: "x"
            from:200
            to: 700
            duration: root.duration
        }
    }
}
