import QtQuick 2.15



//矩形框默认大小就是48*48
Rectangle {
    width: 48
    height: 48
    color: "darkblue"
    //基于填充色给矩形框一个边框高亮（虽然看不出来
    border.color: Qt.lighter(color)
}




