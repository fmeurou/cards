import QtQuick 2.0

Rectangle {
    property string theme: "qrc:/img/turbo.jpg"
    property var cardModel
    property string name
    property bool hasDrawn: false
    property bool inBattle: false
    property bool firstBattleCard: false
    property bool secondBattleCard: false
    signal playerDraws()
    signal lockDeck()
    signal unlockDeck()
    signal addCard(var card)
    signal resetStack()
    signal resetBoard()
    signal displayMessage(string message)
    radius: 3
    border  {
        width: 1
        color: "black"
    }

    clip: true
    Deck    {
        id: deckView
        theme: theme
        height: (parent.height / 2) - 20
        cardWidth: height / 1.414
        width: cardWidth + 200
        enabled: !hasDrawn || inBattle
        anchors {
            bottom: parent.bottom
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        deckModel: cardModel
        onPopModel: {
            hasDrawn = true
            if(inBattle)    {
                if(!firstBattleCard)    {
                    stack.addCard(card, false, false)
                    firstBattleCard = true
                }   else   if(!secondBattleCard)    {
                    stack.addCard(card, true, false)
                    inBattle = false
                    secondBattleCard = true
                }
            }   else    {
                stack.addCard(card, true, true)
            }
            playerDraws()
        }
    }
    Stack   {
        id: stack
        height: (parent.height / 2) - 20
        cardWidth: height / 1.414
        width: cardWidth + 200
        anchors {
            top: parent.top
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }

    Text    {
        id: cardsCount
        anchors {
            verticalCenter: deckView.verticalCenter
            left: deckView.right
            leftMargin: 20
        }
        text: cardModel.count + " cards"
    }

    Text    {
        id: playerBox
        visible: true
        color: "black"
        anchors {
            bottom: cardsCount.top
            bottomMargin: 20
            left: deckView.right
            leftMargin: 20
        }
        font    {
            pointSize: 20

        }

        text: name
    }
    Text    {
        id: messageBox
        visible: true
        opacity: 0
        color: "red"
        anchors {
            bottom: cardsCount.top
            bottomMargin: 20
            left: playerBox.right
            leftMargin: 20
        }
        font    {
            pointSize: 20

        }

        text: cardModel.count + " cards"
    }
    SequentialAnimation {
        id: animation
        PropertyAnimation { target: messageBox; property: "opacity"; to: 1; duration: 500 }
        PropertyAnimation { target: messageBox; property: "opacity"; to: 0; duration: 500 }
    }

    Component.onCompleted: {
        console.log("board loaded", cardModel.count)
    }

    onLockDeck: deckView.enabled = false
    onUnlockDeck: deckView.enabled = true
    onAddCard: cardModel.append(card)
    onResetStack: stack.clearStack()

    onResetBoard: {
        resetStack()
        cardModel.clear()
        hasDrawn = false
        inBattle = false
        firstBattleCard = false
        secondBattleCard = false
    }

    function getStack()  {
        console.log("board get rank from stack", stack.getCard().rank)
        return stack
    }

    onDisplayMessage: {
        messageBox.text = message
        animation.running = true
    }

}

