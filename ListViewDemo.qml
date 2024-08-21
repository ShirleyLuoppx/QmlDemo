import QtQuick 2.15

import QtQuick 2.0
import QtQuick.Controls 2.0



ListView {
    width: 500
    height: 200

    property variant myArray : createArray(17, 33, 0.5);

    //model：列表的数据属性
    model: myArray

    //listview的item代理
    delegate: Item {
        width: 500
        height: 50

        //item的内容
        Rectangle {
            width: parent.width
            height: 50
            color:  index%2==0? "lightblue":"lightgreen"

            Text {
                anchors.centerIn: parent
                //这里获取数据元素里面自定义的key的值，使用model.key
                text: myArray[index]
            }

            MouseArea{
                //鼠标点击区域为整个父类
                anchors.fill: parent
                onClicked: {
                    //index 很重要，因为他没得提示，所以需要自己记住，listview列表当前点击的item的下标是index，下标从0开始
                    console.log("listview click item index = ",index)
                    console.log("listview clickdata = ",myArray[index])
                }
            }
        }
    }

    function createArray(start, end, step) {
      var arr = [];
      for (var i = start; i <= end; i += step) {
        arr.push(i);
      }
      return arr;
    }
}



//====================================================================================================

//就是安卓的listview一样的，竖直显示的一个可滑动列表
// ListView {
//     width: 500
//     height: 200

//     //model：列表的数据属性
//     model: ListModel {
//         //列表元素数据
//         ListElement {
//             //key 是自定义的，可以随意写，只要自己能知道这个key是什么意思就行
//             text: "Item 1"
//         }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//         ListElement { text: "Item 1" }
//         ListElement { text: "Item 2" }
//         ListElement { text: "Item 3" }
//     }

//     //listview的item代理
//     delegate: Item {
//         width: 500
//         height: 50

//         //item的内容
//         Rectangle {
//             width: parent.width
//             height: 50
//             color:  index%2==0? "lightblue":"lightgreen"

//             Text {
//                 anchors.centerIn: parent
//                 //这里获取数据元素里面自定义的key的值，使用model.key
//                 text: model.text
//             }

//             MouseArea{
//                 //鼠标点击区域为整个父类
//                 anchors.fill: parent
//                 onClicked: {
//                     //index 很重要，因为他没得提示，所以需要自己记住，listview列表当前点击的item的下标是index，下标从0开始
//                     console.log("listview click item index = ",index)
//                     console.log("listview clickdata = ",model.text.get())
//                 }
//             }
//         }
//     }
// }

//==============================================================================================

// ListView{
//     id:listViewRoot
//     width: 500
//     height: 600

//     //也可以这样直接给model赋值一个数组数据
//     model: ListModel{
//         ListElement{
//             songName:"blackpink in your area"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"flower"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"kill this love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"bombaya"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"love sick girl"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"solo"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"lalisa"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"merry chrismas"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"ready for love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"how you like that"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"duu duu duu"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"whistle"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"playing with fire"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"blackpink in your area"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"flower"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"kill this love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"bombaya"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"love sick girl"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"solo"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"lalisa"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"merry chrismas"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"ready for love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"how you like that"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"duu duu duu"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"whistle"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"playing with fire"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"blackpink in your area"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"flower"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"kill this love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"bombaya"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"love sick girl"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"solo"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"lalisa"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"merry chrismas"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"ready for love"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"how you like that"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"duu duu duu"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"whistle"
//             author:"bp"
//             singer:"bp"
//         }
//         ListElement{
//             songName:"playing with fire"
//             author:"bp"
//             singer:"bp"
//         }
//     }


//     delegate: Rectangle{
//         width: 500
//         height: 50
//         // color: index%2==0?"lightblack":"lightpink"
//         //选中的item背景改色
//         color: listViewRoot.currentIndex == index ? "lightpink" : "lightblack"
//         Text {
//             id: author
//             text: model.author
//             anchors.left: parent.left
//             anchors.leftMargin: 10
//             anchors.top: parent.top
//             anchors.topMargin: 10
//             color: "#882200"
//         }

//         Text {
//             id: singer
//             text: model.singer
//             anchors.right: parent.right
//             anchors.rightMargin: 10
//             anchors.top: parent.top
//             anchors.topMargin: 10
//             color: "#009988"
//         }

//         Text {
//             id: songName
//             text: model.songName
//             anchors.centerIn: parent
//             font.pixelSize: 30
//             font.bold: true
//             //选中的item的文字改变颜色
//             color: listViewRoot.currentIndex == index ? "black" : "white"
//             // color: index%2==0?"white":"black"
//         }

//         MouseArea{
//             anchors.fill: parent
//             onClicked: {
//                 //listviewId.count 获取列表的长度
//                 console.log("list.count = "+listViewRoot.count)
//                 //index,获取当前点击的item的下标，从0开始；
//                 //modelData.length 获取的是当前点击的item的内容长度
//                 //model.songName 获取歌曲名称
//                 console.log("listview currentindex = "+index+"，songName = "+model.songName )
//                 //点击的时候，给当前选中的item的index赋值
//                 listViewRoot.currentIndex = index
//             }
//         }
//     }
//     //选中item的时候的外观，但是好像没啥用
//     highlight: Rectangle {
//         color: "lightblue"
//     }
//     //当前index改变监听
//     onCurrentIndexChanged: console.log("onCurrentIndexChanged currentIndex = "+currentIndex)
//     //当前选中的item改变的时候回调
//     onCurrentItemChanged: console.log("onCurrentItemChanged")
//     //这个不知道啥时候回调
//     onCurrentSectionChanged: console.log("onCurrentSectionChanged")
// }



