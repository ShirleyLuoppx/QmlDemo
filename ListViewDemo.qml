import QtQuick 2.15

import QtQuick 2.0
import QtQuick.Controls 2.0

//就是安卓的listview一样的，竖直显示的一个可滑动列表
ListView {
    width: 500
    height: 200

    //model：列表的数据属性
    model: ListModel {
        //列表元素数据
        ListElement {
            //key 是自定义的，可以随意写，只要自己能知道这个key是什么意思就行
            content: "Item 1"
        }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
        ListElement { text: "Item 1" }
        ListElement { text: "Item 2" }
        ListElement { text: "Item 3" }
    }

    //listview的item
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
                text: model.content
            }
        }
    }
}
