import QtQuick 2.15

FocusScope {
    width: 100
    height: 100

    Rectangle{
        width: parent.width
        height: parent.height
        color: "lightblue"
        border.width: 2
        border.color: "black"
        anchors.fill: parent
    }

    property alias text: edit.text
    property alias edit: edit

    TextEdit{
        id:edit
        focus: true
        anchors.fill: parent
        anchors.margins: 4
        width: parent.width
        height: parent.height
    }
}
