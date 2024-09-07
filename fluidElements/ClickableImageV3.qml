import QtQuick 2.15

Item {
    id: root
    width: 150
    height: 150
    property alias text: txt.text
    property alias source: ig.source
    signal clicked

    property bool framed: false

    Column{
        id:container

        Rectangle{
            anchors.fill: parent
            color: "white"
            visible: framed

            Image {
                id: ig
                width: 150
                height: 150
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
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
