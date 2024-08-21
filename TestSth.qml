import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item{
    width: 500
    height: 500

    property bool mChecked: false
    property bool mCheckable: true

    signal switchStatusChange(bool status)
    signal switchClick()

    // readonly property bool checked : false

    Switch {
        id: control
        width: 60
        height: 30
        anchors.centerIn: parent

        enabled: false

        indicator: Rectangle {
            id:rect
            width: parent.width
            height: parent.height
            x: control.leftPadding
            y: parent.height / 2 - height / 2
            radius: 15
            color: control.checked ? "#295EDA" : "#B7C0CD"

            //小圆点
            Rectangle {
                id : smallRect
                width: 20
                height: 20
                radius: 12
                anchors.verticalCenter: parent.verticalCenter
                color: "#FFFFFF"

                //改变小圆点的位置-开
                NumberAnimation on x{
                    to: rect.width-smallRect.width-3
                    running: control.checked ? true : false
                    duration: 200
                }

                //改变小圆点的位置-关
                NumberAnimation on x{
                    to: 0+3
                    running: control.checked ? false : true
                    duration: 200
                }
            }
        }
        checkable: mCheckable
        checked: mChecked
    }

    Rectangle{
        id:mengceng
        width: 60
        height: 30
        anchors.centerIn: parent
        color: "#00000000"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mChecked = !mChecked
                console.log("click mengceng ...")
            }
        }
    }

    Rectangle{
        id:testRect
        width: 100
        height: 100
        color: "gray"
        anchors.top: control.bottom
        anchors.topMargin: 10
        MouseArea{
            anchors.fill: parent
            onClicked: {
                 mChecked = !mChecked
                console.log("click testRect test slider animation...")
            }
        }
    }
}
