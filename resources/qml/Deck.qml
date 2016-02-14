import QtQuick 2.0

Rectangle   {
    id: deckView
    property string theme
    property var deckModel
    property int cardWidth: 100
    property int cardShift: 2
    signal popModel(var card)
    enabled: deckModel.count > 0

    GridView    {
        cellWidth: cardShift
        cellHeight: parent.height
        width: parent.width
        height: parent.height
        anchors {
            top: parent.top
            left: parent.left
        }
        delegate: Cover {
            height: deckView.height
            width: cardWidth
            theme: theme
        }
        model: deckModel
    }

    MouseArea   {
        anchors.fill: parent
        onClicked:   {
            console.log("deck pop card", deckModel.count ,deckModel.get(0))
            popModel(deckModel.get(0))
            deckModel.remove(0)
        }
    }
}


