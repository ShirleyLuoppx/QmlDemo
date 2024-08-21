import QtQuick 2.12
//库一定要都导入，要不然可能会出现无法展示控件的情况
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import QtQuick.Window 2.0

//qml交互
Window{
    id:root
    width: 500
    height: 300
    color: "lightblue"

    Button{
        id:btnSendSignal2Cpp
        width: 100
        height: 50

        Text {
            id: myContent
            text: qsTr("sendSignal2Cpp")
            color: "black"
            anchors.centerIn: parent
        }
        onClicked: {
            console.log("click button send signal to cpp")
            MyQmlInteract.onClickBtnFromQml()
        }
    }
}
