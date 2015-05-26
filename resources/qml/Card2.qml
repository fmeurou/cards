import QtQuick 2.0

CardContent {
    Image   {
        height: parent.height / 3
        source: imgSource
        fillMode: Image.PreserveAspectFit
        antialiasing: true
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }
    Image   {
        height: parent.height / 3
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }
}
