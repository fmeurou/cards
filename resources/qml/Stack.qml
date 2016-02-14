import QtQuick 2.0

Rectangle {
    id: stack

    property int cardWidth: 0
    property int cardShift: 15
    signal addCard(var card, bool flipped, bool clear)
    signal clearStack()

    width: cardWidth + cardStackModel.count * cardShift

    ListModel   {
        id: cardStackModel
    }

    GridView    {
        id: cardStackView
        anchors {
            fill: parent
        }
        clip: true
        width: parent.width
        height: parent.height
        cellWidth: cardShift
        cellHeight: parent.height
        delegate: Card  {
            width: cardWidth
            height: stack.height
            cardColor: colour
            cardRank: rank
            cardFlipped: flipped

        }
        model: cardStackModel
    }
    onAddCard: {
        console.log(card, flipped, clear)
        if(clear)   {
            cardStackModel.clear()
        }

        console.log({rank: card.rank,
                        colour: card.colour,
                        flipped: flipped})
        cardStackModel.append({rank: card.rank,
                               colour: card.colour,
                               flipped: flipped})
    }
    onClearStack: {
        cardStackModel.clear()
    }

    function getCard()  {
        console.log("get card from stack", cardStackModel.count)
        return cardStackModel.get(cardStackModel.count - 1)
    }

    function getModel() {
        return cardStackModel
    }

}

