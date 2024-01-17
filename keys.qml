import QtQuick 2.15

//监听按键的上下左右和放大缩小
Item {
    id:root
    width: 500
    height: 500

    GreenSquare{
        id:square
        width: 50
        height: 50
    }

    focus: true
    Keys.onLeftPressed:  square.x-=1
    Keys.onRightPressed:  square.x+=1
    Keys.onUpPressed:  square.y-=1
    Keys.onDownPressed:  square.y+=1
    Keys.onPressed: {
        switch(event.key){
        case Qt.Key_Plus:
            square.scale+=0.1
            break;

        case Qt.Key_Minus:
            square.scale-=0.1
            break;

        }
    }
}
