import QtQuick 2.15

Item {
    id:root
    width: 1500
    height: 500

    //isCurrentItem
    ListView{
        id:lv1
        width: 100
        height: parent.height
        spacing: 5
        clip: true
        model: 100
        delegate: mComp
    }

    ListModel{
        id:theModel

        ListElement{name:0}
        ListElement{name:1}
        ListElement{name:2}
        ListElement{name:3}
        ListElement{name:4}
        ListElement{name:5}
        ListElement{name:6}
        ListElement{name:7}
        ListElement{name:8}
        ListElement{name:9}
    }

    //点击的时候，在列表最后面添加一个item，有一个动画效果，还是不错的
    Rectangle{
        id:rectAdd
        width: 100*5
        height: 30
        color: "darkgreen"
        anchors.left: lv1.right
        anchors.leftMargin: 100

        property int count: 9

        Text{
            text: "add item"
            anchors.centerIn: parent
            font.pixelSize: 20
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                theModel.append({"name":++ rectAdd.count})
            }
        }
    }

    //append-onAdd，remove-onRemove
    GridView{
        id:lv2
        width: 100*5
        height: parent.height
        cellHeight: 30
        cellWidth: 100
        model: theModel
        clip: true
        delegate: addDelComp
        anchors.top: rectAdd.bottom
        anchors.topMargin: 5
        anchors.left: rectAdd.left
    }

    Component{
        id:addDelComp

        Rectangle{
            id:wrapper
            width: 100
            height: 30
            color: "lightgreen"

            Text{
                text: "index:"+name
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // if(!wrapper.GridView.delayRemove){
                        theModel.remove(index)
                    // }
                }
            }

            //调用 theModel.remove 移除点击的item的时候会触发 GridView.onRemove ，此时使用一个顺序动画，先将延迟移除的属性设置为true，等待缩放动画从1到0执行完毕后，再将延迟移除的属性置回来false
            GridView.onRemove:SequentialAnimation{
                PropertyAction{
                    target: wrapper
                    property: "GridView.delayRemove"
                    value:true
                }
                NumberAnimation{
                    target: wrapper
                    duration: 250
                    property: "scale"
                    from: 1
                    to: 0
                    easing.type: Easing.InOutQuad
                }
                PropertyAction{
                    target: wrapper
                    property: "GridView.delayRemove"
                    value:false
                }
            }

            //调用  theModel.append 追加数据的时候，会触发 GridView.onAdd ，此时使用一个顺序动画，将缩放从0到1执行
            GridView.onAdd:SequentialAnimation{
                NumberAnimation{
                    target: wrapper
                    duration: 250
                    property: "scale"
                    from: 0
                    to: 1
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Component{
        id:mComp

        Rectangle{
            width: 100
            height: 30
            color: ListView.isCurrentItem?"lightblue":"lightpink"   // isCurrentItem  是否是第一个item？？

            Text {
                anchors.centerIn: parent
                text: index
            }
        }
    }
}
