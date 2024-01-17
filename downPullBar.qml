import QtQuick 2.15

Item {
    visible: true
    width: 400
    height: 600

    Item
    {
        id:mainItem
        width: parent.width
        height: 600

        Rectangle {
            property int startDragY: 0
            id: topPanel
            width: parent.width
            height: 600
            color: "lightblue"
            x:0
            y:-topPanel.height
            z:1

            Text {
                anchors.centerIn: parent
                text: "Top Panel"
            }
        }

        Rectangle {
            width: parent.width
            height: 600
            color: "lightgreen"

            Text {
                anchors.centerIn: parent
                text: "Main Content"
            }
        }

        MouseArea {
            anchors.fill: parent
            drag.target: topPanel
            drag.axis: Drag.YAxis

            onPressed:
            {
                console.log("press")
                // 记录初始位置
                topPanel.startDragY = mouse.y;
            }

            onPositionChanged: {
                console.log("change")
                // 计算新的位置，确保 topPanel 不超过顶部和底部
                topPanel.y = Math.min(Math.max(topPanel.startDragY + mouse.y - mouse.startY, 0), parent.height - topPanel.height);
            }
        }
    }
}
