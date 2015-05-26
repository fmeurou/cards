import QtQuick 2.0

Rectangle {
    id: ecusson
    property string eText: ""
    property string eColor: ""
    property string eImage: ""
    width: 10
    height: rankText.contentHeight + width
    Text   {
        id: rankText
        width: parent.width
        anchors {
            top: parent.top
            left: parent.left
        }
        text: eText
        horizontalAlignment: Text.AlignHCenter
        color: eColor
        fontSizeMode: Text.HorizontalFit
    }
    Image   {
        id: colorImage
        width: parent.width
        anchors {
            bottom: parent.bottom
            top: rankText.bottom
            left: parent.left
        }
        source: eImage
        fillMode: Image.PreserveAspectFit
    }
}

