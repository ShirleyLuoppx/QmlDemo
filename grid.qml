import QtQuick 2.15

Item {
    id:root
    width: 500
    height: 200

    //Grid
    Grid{
        id:grid
        rows: 2
        columns: 3
        anchors.centerIn: parent
        RedSquare{}
        RedSquare{}
        RedSquare{}
        RedSquare{}
        RedSquare{}
        RedSquare{}
    }
}
