import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id:root
    width: 600
    height: 500
    color: "#00000000"

    Slider{
        id:slider
        width: igSlider.width
        height: 13
        background: null
        anchors.centerIn: parent
        from: 0
        to: 9
        stepSize: 1
        snapMode: Slider.SnapAlways

        onValueChanged: {
            console.log("slider onValueChanged = "+value)
        }

        Image {
            id: igSlider
            source: "./imagine-assets/bg_windlevel_horizaontal.png"
        }
    }
}
