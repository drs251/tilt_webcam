import QtQuick 2.5
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5
import Qt.labs.settings 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "tilt webcam"
    color: "black"

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
    }

    VideoOutput {
        id: output
        source: camera
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        focus : visible // to receive focus and capture key events when visible
        //rotation: box.value
    }

    Column {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 5

        Label {
            color: "white"
            text: "Rotation (°): "
        }

        ComboBox {
            id: box
            model: [0, 45, 135, 225, 315]
            onCurrentTextChanged:
                output.rotation = currentText

            Settings {
                property alias currentText: box.currentText
                property alias currentIndex: box.currentIndex
            }
        }
    }
}
