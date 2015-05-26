import QtQuick 2.0

CardContent {
    Image   {
        height: parent.height / 4
        source: imgSource
        fillMode: Image.PreserveAspectFit
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }
    Image   {
        height: parent.height / 4
        source: imgSource
        fillMode: Image.PreserveAspectFit
        anchors {
            centerIn: parent
        }
    }
    Image   {
        height: parent.height / 4
        source: imgSource
        fillMode: Image.PreserveAspectFit
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }
}
