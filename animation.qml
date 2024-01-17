import QtQuick 2.15

ClickableImage {
    id:root
    width: 1500
    height: 500
    onClicked: {
        egg1.y=270
        egg2.y=270
        egg3.y=270
    }

    Image {
        id: animationImg
        x:20
        source: "./imagine-assets/pic03.jpg"
        NumberAnimation on x{
            to: 300
            duration: 4000
            loops: Animation.Infinite
        }
        RotationAnimation on rotation {
            to: 360
            duration: 4000
            loops: Animation.Infinite
        }
    }

    ClickableImage {
        id: egg1
        source: "./imagine-assets/pic03.jpg"
        x:500
        y:270
        NumberAnimation on y{
            to: 50
            duration: 4000
            loops: Animation.Infinite
        }
    }

    ClickableImage {
        id: egg2
        source: "./imagine-assets/pic03.jpg"
        anchors.left: egg1.right
        anchors.leftMargin: 20
        y:270
        Behavior on y{
            NumberAnimation{ duration: 4000}
        }

        onClicked: y = 50
    }

    ClickableImage {
        id: egg3
        source: "./imagine-assets/pic03.jpg"
        x:320
        anchors.left: egg2.right
        anchors.leftMargin: 20
        y:270
        onClicked: anim.start()
        
        NumberAnimation{
            id:anim
            target: egg3
            properties: "y"
            from: 270
            to: 50
            duration: 4000
        }
    }
}
