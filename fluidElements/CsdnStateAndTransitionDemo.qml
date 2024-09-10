import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.12

//State and Transitions 的使用demo ：https://blog.csdn.net/wj584652425/article/details/137572984
Item {
    id: satt
    width: 500
    height: 500

    // （状态）按钮
    Button {
        id: leftRectMoveBtn
        text: "左侧矩形移位"
    }

    // （状态）复选框
    CheckBox {
        id: rightRectMoveCheckBox
        text: "右侧矩形移位"
        checked: false
        // 锚点布局
        anchors.left: leftRectMoveBtn.right
    }

    // 测试按钮
   Button {
       id: testBtn
       text: "状态置空"
       onClicked: satt.state = "" //console.log(leftRect.width)
       anchors.left: rightRectMoveCheckBox.right
       anchors.leftMargin: 20

   }

    // 定义第一个图形
    Rectangle {
        id: leftRect
        x: 100
        y: 100
        width: 50
        height: width
        radius: width / 2
        color: "skyblue"
        // 状态更新操作
        MouseArea {
            id: leftMouseArea
            anchors.fill: parent
            onDoubleClicked: satt.state = "leftDoubleClickWithTransition"
        }
    }


    // 定义第二个图形
    Rectangle {
        id:  rightRect
        x: 200
        y: 100
        width: leftRect.width
        height: width
        radius: width / 2
        color: "lightgray"
        // 状态更新操作
        MouseArea {
            id: rightMouseArea
            anchors.fill: parent
            onDoubleClicked: satt.state = "rightDoubleClickWithTransition"
        }
    }

    states: [
        // **********
        // Sate通过when指定属性变化使用状态
        // **********
        State {
            name: "leftRectMove"
            // 当leftRectMoveBtn按下时触发，释放即恢复
            when: leftRectMoveBtn.pressed
            // 位置属性值更新
            PropertyChanges {
                target: leftRect
                x: 300
                y: 300
            }
        },

        State {
            name: "rightRectMove"
            // 当rightRectMoveCheckBox勾选时触发，取消勾选即恢复
            when: rightRectMoveCheckBox.checkState
            // 位置属性值更新
            PropertyChanges {
                target: rightRect
                x: 5
                y: 300
            }
        },

        // **********
        // Sate通过主动设置使用状态
        // **********
        State {
            name: "leftDoubleClickWithTransition"
            // 左侧元素 宽度、高度、颜色变化
            PropertyChanges {
                target: leftRect
                width: 100
                height: width
                color: "blue"
            }

            // 右侧元素 宽度、高度、颜色变化
            PropertyChanges {
                target: rightRect
                width: 50
                height: width
                color: "lightgray"
            }
        },

        State {
            name: "rightDoubleClickWithTransition"
            // 左侧侧元素 宽度、高度、颜色变化
            PropertyChanges {
                target: leftRect
                width: 50
                height: width
                color: "lightblue"
            }

            // 右侧元素 宽度、高度、颜色变化
            PropertyChanges {
                target: rightRect
                width: 100
                height: width
                color: "gray"
            }
        }
    ]

    // **********
    // Sate切换的过渡
    // **********
    transitions: [
        Transition {
            from: "leftDoubleClickWithTransition"
            to: "rightDoubleClickWithTransition"
            // 左侧图形的动画效果设置
            ColorAnimation {
                target: leftRect
                properties: "color"
                duration: 1500
            }
            PropertyAnimation {
                target: leftRect
                properties: "width,height"
                duration: 1500
            }

            // 右侧熟悉的动画属性设置
            ColorAnimation {
                target: rightRect
                properties: "color"
                duration: 1500
            }
            PropertyAnimation {
                target: rightRect
                properties: "width,height"
                duration: 1500
            }
        },

        Transition {
            from: "rightDoubleClickWithTransition"
            to: "leftDoubleClickWithTransition"
            // 左侧图形的动画效果设置
            ColorAnimation {
                target: leftRect
                properties: "color"
                duration: 1500
            }
            PropertyAnimation {
                target: leftRect
                properties: "width,height"
                duration: 1500
            }

            // 左侧图形的动画效果设置
            ColorAnimation {
                target: rightRect
                properties: "color"
                duration: 1500
            }
            PropertyAnimation {
                target: rightRect
                properties: "width,height"
                duration: 1500
            }
        }
    ]
}

