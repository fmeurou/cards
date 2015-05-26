import QtQuick 2.0

CardContent {
    id: card
    Card3   {
        height: parent.height
        width: parent.width / 2
        anchors {
            top: parent.top
            left: parent.left
        }
        imgSource: card.imgSource
    }
    Card3   {
        height: parent.height
        width: parent.width / 2
        anchors {
            top: parent.top
            right: parent.right
        }
        imgSource: card.imgSource
    }
}
