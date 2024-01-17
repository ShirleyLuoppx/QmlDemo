import QtQuick 2.15

Item {
    id:root
    width:500
    height: 200

    TextInput{
        id:input1
        width: 96
        height: 20
        focus: true
        text: "textinput 1"
        KeyNavigation.tab: input2

    }

    TextInput{
        id:input2
        width: 96
        height: 20
        focus: true
        text: "text input 2"
        anchors.top: input1.bottom
        KeyNavigation.tab: input1
    }   

    TextEdit{
        id:edit
        width:96
        height: 20
        anchors.top: input2.bottom
        focus: true
        text: "text edit"
    }
}
