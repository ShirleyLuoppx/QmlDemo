import QtQuick 2.15

Rectangle{
    // color: "gray"
    width: 500
    height: 500

    Rectangle{
        id:rectImage
        width: parent.width
        height: 300
        color: "lightpink"
        Image {
            id: image
            width: parent.width
            height: parent.height
            source: "imagine-assets/01.png"
            anchors.horizontalCenter: parent
            anchors.top: parent.top
            // fillMode:Image.PreserveAspectCrop //均匀缩放，必要时裁剪
            fillMode: Image.PreserveAspectFit //按比例缩放，不裁剪;
            // fillMode: Image.Stretch //图片拉伸自适应；（默认的）
            // visible: false
        }
    }

    Rectangle{
        width: 100
        height: 100
        color: "black"
        anchors.bottom: parent.bottom

        Text {
            color: "white"
            text: qsTr("左旋转")
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                image.rotation+=90

                if(image.rotation % 180 !=0){
                    image.width = rectImage.height
                    image.fillMode = Image.PreserveAspectCrop//均匀缩放，必要时裁剪
                }else{
                    image.width = rectImage.width
                    image.fillMode = Image.PreserveAspectFit //按比例缩放，不裁剪;
                }
            }
        }
    }
}
