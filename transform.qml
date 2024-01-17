import QtQuick 2.15

//平移，旋转，缩放
Item {
    id:transformRoot
    width:1500
    height:700

    //背景图，点击恢复到原始状态
    ClickableImage{
        id:bg
        anchors.fill: parent
        onClicked: {
            imageTrans.x = 0
            imageRotation.rotation = 0
            imageScale.scale = 1
        }


        //使用封装好的可点击image：平移
        ClickableImage{
            id:imageTrans
            width: 278
            height: 143
            source: "./imagine-assets/sofa.png"
            onClicked: x+=1
            anchors.top: parent.top
            smooth: true
        }

        //使用封装好的可点击image：旋转
        ClickableImage{
            width: 278
            height: 143
            id:imageRotation
            source: "./imagine-assets/sofa.png"
            onClicked:rotation+=1
            anchors.verticalCenter: parent.verticalCenter
        }

        //使用封装好的可点击image：放大
        ClickableImage{
            width: 278
            height: 143
            id:imageScale
            source: "./imagine-assets/sofa.png"
            onClicked: scale+=0.5
            anchors.bottom: parent.bottom
        }
    }
}
