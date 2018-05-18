import QtQuick 2.0
import QtQuick.Layouts 1.3

//This file is no longer used
//Included in the submisssion to ensure the file manifest does not produce any errors

Item{
    id: driverButton
    property alias buttonText: buttonLabel.text
    Rectangle{
        id: driveMode
        width: 200
        height: 75
        radius: 10
        color: buttonMouse.pressed? Qt.darker("grey",1.5):buttonMouse.containsMouse?Qt.lighter("grey",1.5):"grey"
        Text{
            id: buttonLabel
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
        }
        MouseArea{
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}
