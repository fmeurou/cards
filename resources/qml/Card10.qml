import QtQuick 2.0

CardContent {
    id: card
    Card5   {
        width: parent.width
        height: parent.height / 3
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        imgSource: card.imgSource
    }
    Card5   {
        width: parent.width
        height: parent.height / 3
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        imgSource: card.imgSource
    }
}
