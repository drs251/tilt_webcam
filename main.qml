import QtQuick 2.5
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.5
import Qt.labs.settings 1.0
import QtQml 2.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: "tilt webcam"
    color: "black"

    property var savedImage

    Camera {
        id: camera

        //imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

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

    FileDialog {
        id: saveImageDialog
        title: "Please choose a file name"
        nameFilters: [ "Image files (*.png)", "All files (*)" ]
        folder: shortcuts.home
        selectExisting: false
        selectMultiple: false
        sidebarVisible: true
        onAccepted: {
            var urlNoProtocol
            if(Qt.platform.os == "windows") {
                urlNoProtocol = (fileUrl+"").replace('file:///', '');
            } else {
                urlNoProtocol = (fileUrl+"").replace('file://', '');
            }
            var success = root.savedImage.saveToFile(urlNoProtocol)
            if (!success) console.log("An error occured during saving!")
        }
    }

    Column {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 5
        spacing: 5

        Column {
            Label {
                color: "white"
                text: "Rotation (°): "
            }

            ComboBox {
                id: box
                model: [0, 45, 135, 225, 315]
                onCurrentTextChanged:
                    output.rotation = currentText
            }
        }

        Button {
            id: saveButton
            text: "Save image..."
            onClicked: {
                output.grabToImage(function(result) {
                    root.savedImage = result
                    saveImageDialog.open()
                });
            }
        }
    }
}
