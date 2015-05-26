import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: main
    property var colors: ["hearts", "diamonds", "clubs", "spades"]
    property var ranks: ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    property var deck
    property bool inBattle: false
    signal battle()
    signal player1draws()
    signal player2draws()
    signal compareStacks()
    title: qsTr("Battle!")
    width: 1024
    height: 768
    visible: true
    ListModel   {
        id: player1Deck
    }
    ListModel   {
        id: player2Deck
    }

    Board   {
        id: player1
        name: qsTr("player 1")
        height: parent.height / 2
        width: parent.width
        rotation: 180
        cardModel: player1Deck
        anchors {
            top: parent.top
            left: parent.left
        }
        onPlayerDraws: {
            console.log("in battle", main.inBattle)
            if(main.inBattle)    {
                testBattle()
                enableBoards()
            }   else if(player2.hasDrawn)    {
                compareStacks()
            }   else    {
                player1.hasDrawn = true
            }
        }
    }

    Board   {
        id: player2
        name: qsTr("player 2")
        height: parent.height / 2
        width: parent.width
        cardModel: player2Deck
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        onPlayerDraws: {
            console.log("in battle", main.inBattle)
            if(main.inBattle)    {
                testBattle()
                enableBoards()
            }   else if(player1.hasDrawn)    {
                compareStacks()
            }   else    {
                player2.hasDrawn = true
            }
        }
    }



    Rectangle   {
        id: restartButton
        height: parent.height / 2
        width: 50
        radius: 5
        color: "#185E9A"
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        Text    {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            text: "restart"
            color: "#ffffff"
            font    {
                pointSize: 99
            }

            rotation: 270
        }
        MouseArea   {
            anchors.fill: parent
            onClicked: reinit()
        }
    }

    onCompareStacks: {
        resetBattleCards()
        var s1 = player1.getStack()
        var s2 = player2.getStack()
        var c1 = s1.getCard()
        var c2 = s2.getCard()
        var m1 = s1.getModel()
        var m2 = s2.getModel()
        var  comparison = compareRank(c1.rank, c2.rank)
        main.inBattle = false
        console.log("battle output", comparison)
        if(comparison > 0)   {
            player1.displayMessage(qsTr("you win"))
            for(var i = 0; i < m1.count; i++)   {
                player1Deck.append(m1.get(i))
            }
            for(var i = 0; i < m2.count; i++)   {
                player1Deck.append(m2.get(i))
            }
            resetStackTimer.start()
        }   else if(comparison < 0) {
            player2.displayMessage(qsTr("you win"))
            for(var i = 0; i < m1.count; i++)   {
                player2Deck.append(m1.get(i))
            }
            for(var i = 0; i < m2.count; i++)   {
                player2Deck.append(m2.get(i))
            }
            resetStackTimer.start()
        }   else    {
            main.inBattle = true
            player1.inBattle = true
            player2.inBattle = true
        }
    }

    Timer   {
        id: resetStackTimer
        triggeredOnStart: false
        interval: 1500
        onTriggered: {
            player1.resetStack()
            player2.resetStack()
            enableBoards()
        }
    }

    function enableBoards() {
        player2.hasDrawn = false
        player1.hasDrawn = false
    }

    function resetBattleCards() {
        player1.firstBattleCard = false
        player1.secondBattleCard = false
        player2.firstBattleCard = false
        player2.secondBattleCard = false
    }

    Component.onCompleted: reinit()

    function reinit()   {
        player1.resetBoard()
        player2.resetBoard()
        inBattle = false
        deck = []
        for(var i = 0; i < colors.length; i++)  {
            for(var j = 0; j < ranks.length; j++)   {
                deck.push({rank: ranks[j], colour: colors[i]})
            }
        }
        shuffle(deck)
        for(var i = 0; i < deck.length; i++)    {
            if(i % 2)   {
                player1Deck.append(deck[i])
            }   else    {
                player2Deck.append(deck[i])
            }
        }
    }

    function shuffle(o){
        for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
        return o;
    }

    function compareRank(rank1, rank2)  {
        console.log("rank comparison", rank1, rank2, ranks.indexOf(rank1), ranks.indexOf(rank2))
        return ranks.indexOf(rank1) - ranks.indexOf(rank2)
    }


    function getColor(cardColor)    {
        if(cardColor == "hearts" || cardColor == "diamonds")    {
            return "red"
        }
        return "black"
    }

    function getImage(cardColor)    {
        return "qrc:/img/" + cardColor + ".svg"
    }

    function testBattle()   {
        console.log("test battle", player1.firstBattleCard, player1.secondBattleCard, player2.firstBattleCard, player2.secondBattleCard)
        if(player1.firstBattleCard && player1.secondBattleCard && player2.firstBattleCard && player2.secondBattleCard)  {
            compareStacks()
        }
    }
}
