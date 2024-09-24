import QtQuick 2.15

//链表分段
Rectangle {
    width: 600
    height: 290
    color: "white"

    //自己写个例子吧~
    ListView{
        id:listview
        width: 300
        height: parent.height
        clip: true
        model:mModel
        delegate:delegateSongName
        section.property: "singerName"
        section.delegate:delegateSingerName
    }

    Component{
        id:delegateSingerName

        Rectangle{
            width: 300
            height: 20
            color: "lightGray"

            Text {
                text: section   /// 注意：这里分类的头的内容，不再是key的名称了！！不要在这里写 singerName ，会显示不出来的，统一写 section 就行了
                font.bold: true
                color: "black"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
            }
        }
    }

    Component{
        id:delegateSongName

        Rectangle{
            width: 300
            height: 20

            Text {
                text: songName
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
            }
        }
    }

    ListModel{
        id:mModel
        ListElement{songName:"断桥残雪"; singerName:"许嵩" ; }
        ListElement{songName:"素颜"; singerName:"许嵩" ; }
        ListElement{songName:"紫色妹妹"; singerName:"许嵩" ; }
        ListElement{songName:"多余的解释" ; singerName:"许嵩";}

        ListElement{songName:"奢香夫人";singerName:"凤凰传奇" ; }
        ListElement{songName:"狼的诱惑";singerName:"凤凰传奇" ; }

        ListElement{ songName:"黄金甲";singerName:"周杰伦" ;}
        ListElement{ songName:"超人不会飞";singerName:"周杰伦" ;}
        ListElement{ songName:"稻香";singerName:"周杰伦" ;}

        ListElement{songName:"kill this love";singerName:"blackPink" ; }
        ListElement{ songName:"bombaya";singerName:"blackPink" ; }
        ListElement{ songName:"solo";singerName:"blackPink" ; }
        ListElement{ songName:"flower";singerName:"blackPink" ; }
        ListElement{ songName:"lalisa";singerName:"blackPink" ; }
        ListElement{ songName:"ice cream";singerName:"blackPink" ; }
    }

    //官网demo
    ListView {
        width: 300
        height: parent.height
        // anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: spaceMen
        delegate: spaceManDelegate
        section.property: "nation"
        section.delegate: sectionDelegate
        anchors.left: listview.right
    }

    Component {
        id: spaceManDelegate
        Item {
            width: 260
            height: 20
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.pixelSize: 12
                text: name
            }
        }
    }

    Component {
        id: sectionDelegate
        Rectangle {
            width: 260
            height: 20
            color: "lightGray"
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.pixelSize: 12
                font.bold: true
                text: section
            }
        }
    }

    ListModel {
        id: spaceMen
        ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }

        ListElement { name: "Marcos Pontes"; nation: "Brazil"; }

        ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
        ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }

        ListElement { name: "Roberta Bondar"; nation: "Canada"; }
        ListElement { name: "Marc Garneau"; nation: "Canada"; }
        ListElement { name: "Chris Hadfield"; nation: "Canada"; }
        ListElement { name: "Guy Laliberte"; nation: "Canada"; }
        ListElement { name: "Steven MacLean"; nation: "Canada"; }
        ListElement { name: "Julie Payette"; nation: "Canada"; }
        ListElement { name: "Robert Thirsk"; nation: "Canada"; }
        ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
        ListElement { name: "Dafydd Williams"; nation: "Canada"; }
    }
}
