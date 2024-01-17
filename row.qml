import QtQuick 2.15

Item {
    id:root
    width: 500
    height: 200

    //Row
    Row{
        spacing: 10
        anchors.centerIn: parent
        RedSquare{}
        BlueSquare{}
        GreenSquare{}
    }
}
