import QtQuick 2.15

import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    width: 800;
    height: 800;
    color: "black";
    id: root;

    Component {
        id: rectDelegate;
        Item {
            id: wrapper;
            z: PathView.zOrder;
            opacity: PathView.itemAlpha;
            scale: PathView.itemScale;
            Rectangle {
                width: 100;
                height: 60;
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                border.width: 2;
                border.color: wrapper.PathView.isCurrentItem ? "red" : "lightgray";
                Text {
                    anchors.centerIn: parent;
                    font.pixelSize: 28;
                    text: index;
                    color: Qt.lighter(parent.color, 2);
                }
            }
        }
    }

    PathView {
        id: pathView;
        anchors.fill: parent;
        interactive: true;
        pathItemCount: 15;
        preferredHighlightBegin: 0.5;
        preferredHighlightEnd: 0.5;
        highlightRangeMode: PathView.StrictlyEnforceRange;

        delegate: rectDelegate;
        model: 15;

        path:Path {
            startX: 0;
            startY: 400;
            PathAttribute { name: "zOrder"; value: 0 }
            PathAttribute { name: "itemAlpha"; value: 0.1 }
            PathAttribute { name: "itemScale"; value: 0.6 }
            PathLine {
                x: 400;
                y: 400;
            }
            PathAttribute { name: "zOrder"; value: 10 }
            PathAttribute { name: "itemAlpha"; value: 1 }
            PathAttribute { name: "itemScale"; value: 1.2 }
            PathLine {
                x: 800;
                y: 400;
            }
            PathAttribute { name: "zOrder"; value: 0 }
            PathAttribute { name: "itemAlpha"; value: 0.1 }
            PathAttribute { name: "itemScale"; value: 0.6 }
        }

        focus: true;
        Keys.onLeftPressed: decrementCurrentIndex();
        Keys.onRightPressed: incrementCurrentIndex();
    }
}
