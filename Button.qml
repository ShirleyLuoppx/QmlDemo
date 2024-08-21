import QtQuick 2.15

Item {
    id:root
    width: 500
    height:500

    Text {
        id: testClickText
        font.pixelSize:30
        text: qsTr("click here")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        //verticalCenterOffset：垂直偏移量，当垂直居中的时候不太满足需求，可以使用此便宜了来做微调
        anchors.verticalCenterOffset: 20

        //属性行为（属性动画）
        Behavior on rotation {
            NumberAnimation{
                duration: 1000
            }
        }

        //监听rotation属性值的改变，这样就可以一直转起来了
        onRotationChanged: {
            console.log("onRotationChanged rotation = "+rotation)
            if(rotation%360==0){
                testClickText.rotation+=360
            }
        }

        MouseArea{
            anchors.fill: parent
            //点击该表文本框的内容
            onClicked:{
                console.log("click Text ....")
                testClickText.rotation+=360
            }
        }
    }







}
