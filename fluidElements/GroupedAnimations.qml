import QtQuick 2.15

//动画分组：平行动画和顺序动画
Item {
    id:root
    width: 500
    height: 500

    property int duration: 3000

    ClickableImageV3{
        id:imagea
        source: "../imagine-assets/01.png"
        x:50
        y:50
        framed: true
        text: "ParallelAnimation"
        onClicked: {
            paralleAnim.restart()
        }
    }

    ClickableImageV3{
        id:imageb
        source: "../imagine-assets/01.png"
        x:300
        y:50
        framed: true
        text: "SequentialAnimation"
        onClicked: {
            sequentialAnim.restart()
        }
    }


    //ParallelAnimation:平行动画
    ParallelAnimation{//相当于将你需要同时start的动画都放在这个标签里面，然后直接start这一个标签id就行了。如果没有这个标签，那就需用手动start很多个单独的动画id...
        id:paralleAnim

        NumberAnimation{
            id:xAnima
            property: "x"
            duration: root.duration
            target: imagea
            from:imagea.x
            to:200
        }

        NumberAnimation{
            id:yAnima
            property: "y"
            duration: root.duration
            target: imagea
            from:imagea.y
            to:200
        }

        //滴溜溜一转！
        RotationAnimation{
            target: imagea
            to: 720
            duration: root.duration
        }
    }

    // SequentialAnimation:顺序动画，顾名思义，就是这个标签里面的动画是一个接着一个来执行的。
    SequentialAnimation{
        id:sequentialAnim

        NumberAnimation{
            id:aAnima
            property: "x"
            duration: root.duration
            target: imageb
            from:imageb.x
            to:50
        }

        NumberAnimation{
            id:bAnima
            property: "y"
            duration: root.duration
            target: imageb
            from:imageb.y
            to:200
        }
    }
}
