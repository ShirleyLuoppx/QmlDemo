import QtQuick 2.15

//使用Item作为根容器而不是Rectangle做容器，可以减少不必要的开销
Item {
    id:root
    width: 200
    height: 200

    property alias source: ig.source
    property alias text: txt.text
    signal clicked

    Column{
        id:container

        Image {
            id: ig
            width: 200
            height: 200
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: txt
            width: ig.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#111111"
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }


}
