import QtQuick 2.15

//repeater的使用
Item {
    id:root
    width: 1000
    height: 600
    property variant colorArray: ["#00bde3","#67c111","#ea7025"]

    Grid{
        id:grid
        anchors.fill: parent
        spacing: 0
        anchors.margins: 0
        //grid默认的列是4
        columns: 6

        Repeater{
            //数量16个
            model: 30

            Rectangle{
                id:rect
                width: 56
                height: 56
                property int colorIndex: Math.floor(Math.random()*3)
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)

                Text {
                    id: text
                    text: qsTr("Cell "+index)
                    color: "#f0f0f0"
                    anchors.centerIn: parent
                }
            }
        }
    }
}
