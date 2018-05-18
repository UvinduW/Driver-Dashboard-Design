import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

Rectangle{
    property alias socHeight: socOutline.implicitHeight
    width: socOutline.width
    height: socOutline.height+imBatt.height
    color: "transparent"
    Image {
        anchors.bottom: socOutline.top
        width: socOutline.implicitWidth/2
        id: imBatt
        source: "Graphics/BattIcon.png"
    }
    Text{
        anchors.verticalCenter: imBatt.verticalCenter
        anchors.left: imBatt.right
        anchors.leftMargin: 5
        width: socOutline.implicitWidth/2
        id: socText
        font.pixelSize: 20
        font.bold: true
        font.family: "Eurostile"
        color: "white"
        text: String("  " + dashdata.soc).slice(-3) + "%"
    }

    Rectangle{
        id: socOutline
        implicitWidth: implicitHeight*0.3
        border.color: "red"
        border.width: 2
        anchors.bottom: parent.bottom
        Rectangle{
            anchors.bottom: socOutline.bottom
            anchors.left: socOutline.left
            anchors.right: socOutline.right
            anchors.leftMargin: parent.border.width
            anchors.rightMargin: parent.border.width
            anchors.bottomMargin: parent.border.width
            height: dashdata.soc*(parent.height-parent.border.width)/100
            color: "green"
        }

    }
}

