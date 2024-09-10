import QtQuick 2.15

//状态和过渡(交通灯)
Item {
    id: root
    width: 500
    height: 500

    //状态
    Item {
        id: statesItem
        width: 250
        height: parent.height
        state: "red" // 必须要给state赋一个初值，否则在点击事件的时候收到的state事件是空的，就进不去了

        Rectangle {
            id: light1
            x: 25; y: 15
            width: 100; height: width
            radius: width/2
            color: "black"
        }
        Rectangle {
            id: light2
            x: 25; y: 135
            width: 100; height: width
            radius: width/2
            color: "black"
        }
        Rectangle {
            id: light3
            x: 25; y: 255
            width: 100; height: width
            radius: width/2
            color: "black"
        }

        states: [
            State {
                name: "red"
                PropertyChanges {
                    target: light1;
                    color:"red"
                }
                PropertyChanges {
                    target: light2;
                    color:"black"
                }
                PropertyChanges {
                    target: light3;
                    color:"black"
                }
            },

            State {
                name: "green"
                PropertyChanges {
                    target: light1;
                    color:"black"
                }
                PropertyChanges {
                    target: light2;
                    color:"green"
                }
                PropertyChanges {
                    target: light3;
                    color:"black"
                }
            },

            State {
                name: "yellow"
                PropertyChanges {
                    target: light1;
                    color:"black"
                }
                PropertyChanges {
                    target: light2;
                    color:"black"
                }
                PropertyChanges {
                    target: light3;
                    color:"yellow"
                }
            }
        ]

        MouseArea{
            anchors.fill: parent
            onClicked: {

                console.log("-------okin "+parent.state)

                if(parent.state == "red"){
                    parent.state = "green"
                }else if(parent.state == "green"){
                    parent.state = "yellow"
                }else if(parent.state == "yellow"){
                    parent.state = "red"
                }
            }
        }

    }


    //过度
    //颜色过度，这种实现方式着实有点复杂了，颜色过度变化的话也可以用，ColorAnimation来实现呀
    Item{
        id:transitionsItem
        width: 250
        height: parent.height
        anchors.right: parent.right
        state: "red"

        Rectangle {
            id: lighta
            x: 25; y: 15
            width: 100; height: width
            radius: width/2
            color: "black"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("--------click red rect-----------")
                    transitionsItem.state = "red"
                }
            }
        }
        Rectangle {
            id: lightb
            x: 25; y: 135
            width: 100; height: width
            radius: width/2
            color: "black"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("--------click red rect-----------")
                    transitionsItem.state = "green"
                }
            }
        }
        Rectangle {
            id: lightc
            x: 25; y: 255
            width: 100; height: width
            radius: width/2
            color: "black"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("--------click yellow rect-----------")
                    transitionsItem.state = "yellow"
                }
            }
        }

        states: [
            State {
                name: "red"
                PropertyChanges {
                    target: lighta;
                    color:"red"
                }
                PropertyChanges {
                    target: lightb;
                    color:"black"
                }
                PropertyChanges {
                    target: lightc;
                    color:"black"
                }
            },

            State {
                name: "green"
                PropertyChanges {
                    target: lighta;
                    color:"black"
                }
                PropertyChanges {
                    target: lightb;
                    color:"green"
                }
                PropertyChanges {
                    target: lightc;
                    color:"black"
                }
            },

            State {
                name: "yellow"
                PropertyChanges {
                    target: lighta;
                    color:"black"
                }
                PropertyChanges {
                    target: lightb;
                    color:"black"
                }
                PropertyChanges {
                    target: lightc;
                    color:"yellow"
                }
            }
        ]

        transitions: [
            Transition {
                from: "red"
                to: "green"

                ColorAnimation {
                    target: lightb
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lightc
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lighta
                    property: "color"
                    duration: 2000
                }
            },
            Transition {
                from: "green"
                to: "yellow"

                ColorAnimation {
                    target: lightb
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lightc
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lighta
                    property: "color"
                    duration: 2000
                }
            },
            Transition {
                from: "yellow"
                to: "red"

                ColorAnimation {
                    target: lightb
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lightc
                    property: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: lighta
                    property: "color"
                    duration: 2000
                }
            }
        ]
    }
}
