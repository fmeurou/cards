import QtQuick 2.0

Item    {
    id: card
    property string cardColor: "spades"
    property string cardRank: "A"
    property bool cardFlipped: false
    clip: true
    antialiasing: true


    Cover    {
        visible: !cardFlipped
        anchors.fill: parent
        border  {
            width: 1
            color: '#656565'
        }
    }

    Rectangle {
        width: card.width
        height: card.height
        visible: cardFlipped
        radius: 10
        color: "#ffffff"
        border  {
            width: 1
            color: '#656565'
        }

        Ecusson   {
            id: topLeft
            anchors {
                top: parent.top
                topMargin: 5
                left: parent.left
                leftMargin: 5
            }
            eImage: getImage(cardColor)
            eColor: getColor(cardColor)
            eText: cardRank
        }
        // Center layout for cards, not very elegant

        Loader  {
            id: centerImage
            width: parent.width - bottomRight.width - topLeft.width - 10
            height: parent.height - bottomRight.height - topLeft.height - 10
            anchors {
                centerIn: parent
            }
        }


        Ecusson   {
            id: bottomRight
            eImage: getImage(cardColor)
            eColor: getColor(cardColor)
            eText: cardRank
            anchors {
                bottom: parent.bottom
                bottomMargin: 5
                right: parent.right
                rightMargin: 5
            }
        }
    }
    Component.onCompleted: {
        if(card.cardRank == "J" || card.cardRank == "Q" || card.cardRank == "K")    {
            centerImage.source = "CardLetter.qml"
        }   else    {
            centerImage.source = "Card" + card.cardRank + ".qml"
        }
        centerImage.item.imgSource = getImage(card.cardColor)
        centerImage.item.cardRank = card.cardRank
        centerImage.item.cardColor = getColor(cardColor)
    }
}
