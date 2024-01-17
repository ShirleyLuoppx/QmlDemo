import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

//一个window的框，设置了长和宽以及框的标题
//嵌套的层级顺序是按照写代码的顺序来的，写在后面的，就会展示到上层
Window {
    id:root
    width: 1500
    height: 800
    color:"black"
    visible: true
    title: qsTr("Hello World111")

    //window里面嵌套一个矩形框，但是子元素如果宽高超过父元素的话会被覆盖，不能正常显示
    //一个矩形框，设置了长和宽，背景色为红色
    Rectangle {
        id: rect
        width: 500
        height: 1000
        color: "gray"
        visible: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                widthAnimation.running = true
            }
        }
        NumberAnimation {
            id: widthAnimation
            target: rect
            property: "width"
            to: 50
            duration: 5000
        }
    }

    //Text 元素需要依附在父元素上才能正常显示的
    Text {
        id:myText
        width: 100
        height: 50
        text: "Hello World11111111111111"
        font.bold: true
        font.pixelSize: 24
        font.family: "Helvetica"
        //文本过长，省略号居中显示-居左、居右、居中、无
        elide: Text.ElideMiddle
        //文本浮雕效果
        style: Text.Sunken
        styleColor: '#FF4444'
        verticalAlignment: Text.AlignTop
        //属性值 parent.horizontalCenter相对于父元素居中显示  无法直接代码补全，只能手打....
        anchors.horizontalCenter: parent.horizontalCenter
        //属性horizontalCenterOffset是水平居中的偏移量，用于当元素设置了水平居中后，还需要微调的，就使用这个属性；
        //如果元素没有设置horizontalCenter水平居中就使用horizontalCenterOffset水平居中偏移量，那么这个horizontalCenterOffset属性会失效；
        anchors.horizontalCenterOffset: 20
        //垂直居中类似。
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 50
        //Text元素似乎没得clicked的信号，发送不了呢，用一个rect来接收，接收不到..但是用rect发送信号是可以被接收到的
        signal clicked()
        MouseArea{
            // anchors.fill: parent
            onClicked: parent.clicked()
        }
    }

    //给一个名为myRect2的矩形，并给这个矩形添加了一个clicked的点击信号，
    Rectangle{
        id:myRect2
        width: 300
        height: 300
        color: "pink"
        visible: true
        //定义一个信号叫做clicked
        signal clicked()
        //parent.后面的属性值都无法代码补全？？？有点无法理解，还是说是我的操作有问题
        anchors.right: parent.right
        border.width: 10
        border.color: "lightblue"
        radius: 10
        //定义一个MouseArea元素， 用于接收鼠标事件
        MouseArea{
            //鼠标接收事件的区域：是整个当前rect， myRect2
            anchors.fill: parent
            //MouseArea区域接收到onClicked点击事件的时候会发送其父元素的clicked信号，也就是myRect2的clicked
            onClicked: parent.clicked()
        }
    }

    //再定义一个矩形接收clicked信号
    Rectangle{
        id:clikedText
        width: 200
        height: 200
        color: "#FFB6C1"
        visible: true
        //使用anchors 锚点 可以指定当前元素的上下左右对应父元素以及同级元素的相对位置
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        //渐变色
        gradient: Gradient{
            //渐变色开始
            GradientStop{position: 0.0;color: "yellow"}
            //渐变色结束
            GradientStop{position: 1.0;color: "white"}
        }
        //Connections用于连接一个信号到一个槽
        //连接myRect2的clicked事件，执行onClicked里面的内容
        Connections{
            target: myRect2
            onClicked:{
                console.log("click my test......")
            }
        }
    }

    Image {
        id: myImage
        width: 181
        height: 231
        //图片资源先添加一个qrc文件，然后去项目路径下新建一个文件夹把图片资源放进去，回到qtcreator 在qrc下面添加已存在的文件夹，把图片资源文件夹添加进去，使用的时候按照.qml和图片的实际路径来写
        source: "./imagine-assets/pic03.jpg"
        anchors.centerIn: parent
    }

    //测试鼠标点击事件
    Rectangle{
        id:clickRect
        height: 100
        width: 100
        color: "lightblue"
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea{
            anchors.fill: parent
            //clickRect矩形框点击去控制visiableRect矩形的显隐
            onClicked:visiableRect.visible = !visiableRect.visible
        }
    }

    //测试鼠标点击事件
    Rectangle{
        id:visiableRect
        width: 100
        height: 100
        color: "lightpink"
        //注意控件的上下左右设置需要使用anchors.xxx
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: clickRect.bottom
        anchors.topMargin: 10
    }

    //鼠标点击事件练习
    Rectangle{
        id:testClick
        width: 100
        height:50
        color: "darkgreen"
        anchors.left: clickRect.right
        MouseArea{
            anchors.fill: parent
            //点击该表文本框的内容
            onClicked:clickText.text = "after change text"
        }

        Text {
            id: testClickText
            text: qsTr("click here")
            anchors.centerIn: parent
        }
    }

    Text {
        id: clickText
        text: qsTr("texttttttt")
        width: 100
        height: 50
        anchors.left: testClick.right
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    //使用封装好的Button按钮
    Button{
        id:btnTestComponet
        text: "old text"
        onClicked:testComponet.text = "new text"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Text {
        id: testComponet
        text: qsTr(" test my componet value ")
        anchors.bottom: btnTestComponet.top
        anchors.left: btnTestComponet.left
        color: "white"
        anchors.bottomMargin: 10
    }




}
