import QtQuick 2.15

Image {
    id:root
    signal clicked

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }

}


