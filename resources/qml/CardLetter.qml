import QtQuick 2.0

CardContent {
    Text    {
        anchors.fill: parent
        fontSizeMode: Text.Fit
        text: cardRank
        font    {
            pointSize: 99
        }
        anchors {
            centerIn: parent
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        color: cardColor
    }
}

