import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15


Rectangle{
    width: 500
    height: 500
    color: "lightblue"

    Text {
        id: clickText
        text: "click this..."
        anchors.centerIn: parent

        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.open()
            }
        }
    }

    Popup {
        id:root
        width: 200
        height: 200
        anchors.centerIn: parent
        modal: true
        focus: true

        Text {
            id: testText
            text: "这是一个弹框的内容......"
            anchors.centerIn: parent

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // root.close()
                }
            }
        }
    }
}


