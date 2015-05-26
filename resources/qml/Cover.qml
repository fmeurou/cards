import QtQuick 2.0

Rectangle {
    property string theme: "qrc:/img/turbo.jpg"
    radius: 10
    border  {
        width: 1
        color: "#656565"
    }
    clip: true
    Image    {
        width: parent.width - 2
        anchors {
            centerIn: parent
        }
        source: theme
        fillMode: Image.PreserveAspectFit
    }
}
