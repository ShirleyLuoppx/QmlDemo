import QtQuick 2.15

Item {

    id:root
    width: 500
    height: 200

    Flow{
        id:flow
        anchors.centerIn: parent
         RedSquare{}
         BlueSquare{}
         GreenSquare{}
         spacing: 8
    }
}
