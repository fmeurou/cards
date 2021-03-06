import QtQuick 2.0

CardContent {
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            top: parent.top
            topMargin: parent.height / 6
            horizontalCenter: parent.horizontalCenter
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            top: parent.top
            left: parent.left
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            top: parent.top
            right: parent.right
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
    Image   {
        height: parent.height / 3
        width: parent.width / 3
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        source: imgSource
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }
}
