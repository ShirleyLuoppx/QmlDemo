import QtQuick 2.15
import QtQuick.Controls 2.14

Rectangle {
    visible: true
    width: 800
    height: 600

    // Column{
    //     anchors.centerIn: parent
    //     ListModel
    //     {
    //         id:my_model
    //         ListElement{names: "q";}
    //     }
    //     Component
    //     {
    //         id: my_delegate
    //         Rectangle
    //         {
    //             width: 40
    //             height: 35
    //             color: "red"
    //             Text {
    //                 id:my_text
    //                 anchors.centerIn: parent
    //                 text:names
    //             }
    //             MouseArea
    //             {
    //                 anchors.fill:  parent
    //                 onClicked:
    //                     my_model.append({names: "q"}) // 添加一个元素
    //                 //my_model.remove(index)	// 移除一个元素
    //             }
    //         }

    //     }
    //     Repeater
    //     {
    //         model: my_model
    //         delegate:my_delegate
    //         onItemAdded: console.log("add a item")
    //     }
    // }


    //     Column
    //     {
    //         spacing: 5
    //         anchors.centerIn: parent
    //         Repeater
    //         {
    //             id:rep
    // //            model:10
    // //            model: ["11111","22222","33333","44444","555555","6666","777777"]
    //             model: ListModel{
    //                 ListElement{name1: "heisai";value:"123456"}
    //             }
    //             Rectangle
    //             {
    //                 id: yang
    //                 width: 640
    //                 height: 30
    //                 radius: 3
    //                 color: "lightBlue"
    //                 Text {
    //                     id: name
    //                     anchors.centerIn: parent
    //                     //text: qsTr("text:"+ index)
    //                     //text: qsTr("text:" + modelData)
    //                     text: qsTr("text:" + name1 + value)
    //                 }
    //                 MouseArea
    //                 {
    //                     anchors.fill: parent
    //                     onClicked:
    //                     {
    //                         console.log(name.text)

    //                     }
    //                 }
    //             }
    //         }
    //     }

    Column{
        id:root
        width: 600
        height: 500

        //Repeater 相当于 listview的感觉
        Repeater{
            //
            // model: ["111","111","111","111","111","111","111","111"]
            model: 100

            Rectangle{
                width: 600
                height: 50

                Text {
                    id: textId
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    // text: qsTr("content:"+modelData)
                    text: qsTr("content:"+index)
                }
            }
        }
    }
}
