import QtQuick 2.15

Item {
    id:coloumTest
    width: 240
    height: 500

    //Column
    Column{
        spacing: 50
        anchors.centerIn: parent
        RedSquare{}
        BlueSquare{width: 100}
        GreenSquare{}
    }

}
