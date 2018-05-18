import QtQuick 2.0
import QtQuick.Layouts 1.3

//This file is no longer used
//Included in the submisssion to ensure the file manifest does not produce any errors

Item {
    property int range: parent.width;
    ColumnLayout{
        Layout.fillHeight: true
        anchors.fill: parent

        RowLayout{
            // Range row
            height: parent.height/6
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter

            Text {
                id: txtRange
                font.pixelSize: 50
                font.bold: true
                font.family: "Eurostile"
                color: "white"
                text: qsTr("Range " + range.toString() + " km")
            }
        }
        RowLayout{
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            DriverWarnings{
                Layout.preferredWidth: parent.width/3
            }

            CentreCircle{
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width/3
            }
            CentreCircle{
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width/3
            }
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            Rectangle{anchors.fill: parent; color: "purple"}
            Text{
                id: driveTip
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                color: "white"
                text: "Keep power draw to under 80 kW to complete journey without recharge"
            }
        }


        RowLayout{
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                id: driveMode
                width: 200
                height: 75
                radius: 10
                color: "grey"
                Text{
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Driving Mode: Eco"
                }
            }

            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                id: chargeDoor
                width: 200
                height: 75
                radius: 10
                color: "grey"
                Text{
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Door: Open"
                }
            }


            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                id: chargeMode
                width: 200
                height: 75
                radius: 10
                color: "grey"
                Text{
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Charge: Fast"
                }
            }
        }
    }
}
