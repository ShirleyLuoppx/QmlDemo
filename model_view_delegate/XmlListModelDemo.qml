import QtQuick 2.15
import QtQuick.XmlListModel 2.0

//没太看懂，官网demo运行出来没有效果，可能是因为没有网络..先不管了
//xml 模型
Item {
    width: 300
    height: 480
    Component {
        id: imageDelegate
        Item {
            width: listView.width
            height: 400
        Column {
                Text {
                    text: title
                }
                Image {
                    source: imageSource
                }
            }
        }
    }
    XmlListModel {
        id: imageModel
        source: "http://feeds.nationalgeographic.com/ng/photography/photo-of-the-day/"
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "imageSource"; query: "substring-before(substring-after(description/string(), 'img src=\"'), '\"')" }
    }
    ListView {
        id: listView
        anchors.fill: parent
        model: imageModel
        delegate: imageDelegate
    }
}
