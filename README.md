# tilt_webcam
A simple app to show the output of a webcam on the screen, with the ability to tilt it.

This is intended to be used with a certain confocal microscope, which by default shows a tilted image of the sample with respect to the axes of motion. This little program corrects the problem by allowing the user to tilt the image by 45°, 135°, 225° and 315°.

## How to build

tilt_webcam uses Qt with QML and should be easily built with any configuration of Qt. The suggested tool is Qt Creator.

### How to build for Windows XP
Use Qt Creator, Qt 5.5 and the MinGW 5.5.1 32bit compiler, all of which can easily be installed with the Qt installation tool (although you might need a newer version of Windows as a build environment). Go to Projects -> Build Settings -> Build Environment, click ADD and set LINK to /SUBSYSTEM:WINDOWS,5.01 (i.e. the variable is LINK and the value is /SUBSYSTEM:WINDOWS,5.01). Use [`windeployqt`](https://doc.qt.io/qt-5/windows-deployment.html) to collect the various libraries in the program folder (don't forget to specify the path to main.qml via the --qmldir option).

## Prebuilt binaries

[Currently availble only for Windows XP and higher.](https://github.com/drs251/tilt_webcam/releases/tag/0.1)
