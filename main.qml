import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtMultimedia 5.8

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
            verticalAlignment: Label.AlignVCenter
            background: Rectangle {
                color: "black"
                opacity: 0.5
            }
        }

        ComboBox {
            id: box
            model: [0, 45, 135, 225, 315]
            onCurrentTextChanged:
                output.rotation = currentText
        }
    }
}
