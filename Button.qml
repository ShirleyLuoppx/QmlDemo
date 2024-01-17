import QtQuick 2.15

Item {
    id:root
    width: 100
    height:50
    anchors.left: parent.right

    Rectangle{
        id:testClick
        width: parent.width
        height: parent.height
        color: "darkgreen"

        signal clicked

        MouseArea{
            anchors.fill: parent
            //点击该表文本框的内容
            onClicked:{
                testClick.clicked()
            }
        }

        Text {
            id: testClickText
            text: qsTr("click here")
            anchors.centerIn: parent
        }
    }
}
