import QtQuick 2.15

Item {
    id:root
    width: 1500
    height: 500

    ListView{
        id:lv1
        model: 100
        delegate: mComponent
        spacing: 2
        width: 100
        height: parent.height
        clip: false
    }

    //boundsBehavior
    //snapMode
    ListView{
        id:lv2
        model: 100
        delegate: mComponent
        spacing: 2
        width: 100
        height: parent.height
        clip: true  //当delegate中的内容长度大于代理 本身的view长度时，是否需要裁剪内容，默认false，不裁剪
        anchors.left: lv1.right
        anchors.leftMargin: 5
        boundsBehavior: Flickable.DragAndOvershootBounds
        //boundsBehavior：控制列表滑动到底部时，是否还能继续滑动
        //Flickable.StopAtBounds：不能继续滑动
        //Flickable.DragOverBounds：可以继续滑动
        //Flickable.OvershootBounds：没有滑动到底部的时候往上滑动，当滑到底部的时候还可以“用剩余的力”继续往上滑动；当滑动到底部的时候，就不能再继续往上滑动了。
        //Flickable.DragAndOvershootBounds (default)：默认值，可以继续滑动
        snapMode: ListView.SnapToItem // 加上这个属性后滑动会，变得不丝滑，一次只能滑几个item
    }

    //orientation
    //layoutDirection
    ListView{
        id:lv3
        model: 100
        delegate: mComponent
        spacing: 2
        width: 500
        height: 30
        anchors.left: lv2.right
        anchors.leftMargin: 5
        orientation: ListView.Horizontal //控制列表的横/纵向 ListView.Vertical(默认)或者ListView.Horizontal
        layoutDirection:Qt.RightToLeft //控制列表从左到右还是从右到左 Qt.LeftToRight(默认)或者Qt.RightToLeft
        clip: true
    }

    //highlight
    //focus
    ListView{
        id:lv4
        anchors.fill: parent
        // anchors.left: lv3.right
        // anchors.leftMargin: 5
        anchors.margins:220
        model: 100
        width: 100
        height: parent.height
        clip: true
        spacing: 2
        focus: true
        highlight: highlightComponent //这个highlight效果是一个动画，像一条伸缩的皮筋，从最宽地方缩回来，emmm...
        delegate: mComponent
        highlightRangeMode: ListView.ApplyRange
    }

    //footer、header
    ListView{
        id:lv5
        width: 100
        height: parent.height
        clip: true
        model: 5
        delegate: mComponent
        spacing: 2
        footer: footerComp
        header:headerComp
        anchors.left: lv3.right
        anchors.leftMargin: 5
    }

    //gridview
    GridView{
        id:gv1
        width: 100*5
        height: 500
        cellWidth: 100
        cellHeight: 30
        model: 100
        clip: true
        anchors.left: lv5.right
        anchors.leftMargin: 5
        flow: GridView.LeftToRight // 从左至右，从右至左，从上到下，从下到上
        delegate: mComponent
    }

    Component{
        id:footerComp
        Rectangle{
            width: 100
            height: 30
            color: "yellow"
        }
    }

    Component{
        id:headerComp
        Rectangle{
            width: 100
            height: 30
            color: "red"
        }
    }

    Component{
        id:mComponent
        Rectangle{
            width: 100
            height: 30
            color: "lightBlue"

            Text {
                text: index == 0 ? "===============================" : index
                anchors.centerIn: parent
            }
        }
    }

    Component{
        id:highLightComponent
        Rectangle{
            width: ListView.view.width
            color: "lightgreen"
        }
    }

    Component {
        id: highlightComponent
        Item {
            width: ListView.view.width
            height: ListView.view.currentItem.height
            y: ListView.view.currentItem.y
            Behavior on y {
                SequentialAnimation {
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 200 }
                    NumberAnimation { duration: 1 }
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 200 }
                }
            }
            Rectangle {
                id: highlightRectangle
                anchors.fill: parent
                color: "lightGreen"
            }
        }
    }
}
