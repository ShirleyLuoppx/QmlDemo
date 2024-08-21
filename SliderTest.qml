import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle
{
    property int sliderWidth: 20
    property int sliderHeight: 400
    property int sliderorientation: Qt.Vertical
    property int sliderMin: 0
    property int sliderMax: 100
    property int sliderCurValue: 25

    signal currentValueChange(int value)

    id:sliderLayout
    width:50
    height: 700

    Slider {
        anchors.centerIn: parent
        id:contentslider
        width: sliderWidth
        height: sliderHeight
        from: sliderMin
        value: sliderCurValue
        to: sliderMax
        orientation: sliderorientation
        background: null
        padding: 0
        onValueChanged: {
            console.log("contentslider.value = "+contentslider.value)
            currentValueChange(contentslider.value)
        }
        Image {
            width: parent.width
            height: parent.height
            source: "./imagine-assets/bg_windlevel.png"  // 设置背景图片
        }
    }
}
