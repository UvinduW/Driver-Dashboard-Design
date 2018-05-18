import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

//Groupbox Code: https://stackoverflow.com/questions/46579359/styling-groupbox-in-qml-2

//Maintenance mode screen - displays more detailed information about the vehicle and battery system

Item {
    property bool chargeMode: dashdata.chargeMode
    property int door: dashdata.doorState
    property string doorText: "Closed"
    property string chartName: "Null"
    Button{
        //Button to open settings - not yet implemented
        id: settingsButton
        font.pixelSize: 20
        font.bold: true
        font.family: "Eurostile"
        Text{
            id: buttonLabel
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "Settings"
        }
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 75
            radius: 10
            color: settingsButton.down ? Qt.darker("grey",1.5) : "grey"
            border.color: "#26282a"
            border.width: 1

        }
    }
    GroupBox{
        // A GroupBox to hold a few key status details
        id: statusGroup
        property int factor: 15
        anchors.verticalCenter: warningGroup.verticalCenter
        anchors.left: warningGroup.right
        anchors.leftMargin: 10
        height: warningBox.totalHeight+factor*3
        width: dataPlotGroup.width
        background: Rectangle {
            width: parent.width
            color: "transparent"
            border.color: "#21be2b"
            radius: 10
        }

        label: Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: -height/2
            color: "black"                  //set this to the background color
            width: parent.width * 0.5
            height: statusTitle.font.pixelSize
            Text {
                id: statusTitle
                text: qsTr("Current Status")
                anchors.centerIn: parent
                font.pixelSize: 32
                color: "white"
            }
        }

        Text{
            //State of charge
            id: socValLabel
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "State of Charge:"
        }
        Text{
            //Battery voltage
            id: battVValLabel
            anchors.top: socValLabel.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "Battery Voltage:"
        }
        Text{
            //Battery temperature
            id: battTempValLabel
            anchors.top: battVValLabel.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "Battery Temp:"
        }
        Text{
            //Vehicle range
            id: rangeLabel
            anchors.top: battTempValLabel.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "Vehicle Range:"
        }
        Text{
            //Value for SoC
            id: txtSoc
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: dashdata.soc + "%"
        }
        Text{
            //Value for battery voltage
            id: txtVoltage
            anchors.top: socValLabel.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: dashdata.battVoltage + " V"
        }
        Text{
            //Value for battery temperature
            id: txtTemp
            anchors.top: battVValLabel.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: dashdata.battTemp + "°C"
        }
        Text{
            //Value for range
            id: txtRange
            anchors.top: battTempValLabel.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: dashdata.range + " km"
        }

    }
    GroupBox{
        //A groupbox to hold the different warnings
        id: warningGroup
        property int factor: 15
        anchors.top: settingsButton.bottom
        anchors.topMargin: 20
        height: warningBox.totalHeight+factor*3
        width: warningBox.totalWidth+factor*1.5
        background: Rectangle {
            width: parent.width
            color: "transparent"
            border.color: "#21be2b"
            radius: 10
        }

        label: Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: -height/2
            color: "black"                  //set this to the background color
            width: parent.width * 0.7
            height: warningTitle.font.pixelSize
            Text {
                id: warningTitle
                text: qsTr("WARNINGS")
                anchors.centerIn: parent
                font.pixelSize: 32
                color: "white"
            }
        }
        DriverWarnings{
            //Load the warnings from file and scale the warnings
            //appropriately using sizeFactor
            id: warningBox
            anchors.top: parent.top
            anchors.topMargin: 20
            sizeFactor: warningGroup.factor
        }

    }

    GroupBox{
        //Hold buttons to bring up cell information screens
        id: cellInfoGroup
        property int factor: 15
        anchors.top: warningGroup.bottom
        anchors.topMargin: 20
        height: (cellTempButton.height + cellVButton.height) * 1.3
        width: warningBox.totalWidth+factor*1.5
        background: Rectangle {
            width: parent.width
            color: "transparent"
            border.color: "#21be2b"
            radius: 10
        }

        label: Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: -height/2
            color: "black"                  //set this to the background color
            width: parent.width * 0.85
            height: cellInfoTitle.font.pixelSize
            Text {
                id: cellInfoTitle
                text: qsTr("Cell Information")
                anchors.centerIn: parent
                font.pixelSize: 32
                color: "white"
            }
        }

        Column{
            //A vertical column of buttons
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            spacing: 10
            Button{
                //Show cell temperature screen
                id: cellTempButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                //When button is pressed, the CellDataScreen is loaded
                //For full implementation, the type of data that needs to be shown on that
                //screen should also be passed or set as a variable
                onPressed: {chartName="CellDataScreen.qml"}
                Text{
                    id: cellTempLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Temperatures"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: cellTempButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }

            Button{
                //Show cell voltage - the functionality of this button has not yet been implemented
                id: cellVButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                onPressed: {chartName="Null"}
                Text{
                    id: cellVLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Voltages"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: cellVButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }

        }

    }




    GroupBox{
        //Holds the buttons that will bring up the time plots
        //These are not yet functional as the time plot screens have not yet been built
        id: dataPlotGroup
        property int factor: 15
        anchors.left: cellInfoGroup.right
        anchors.leftMargin: 10
        anchors.verticalCenter: cellInfoGroup.verticalCenter
        anchors.topMargin: 20
        height: (cellTempButton.height + cellVButton.height) * 1.3
        width: cellVPButton.width*2 + 70
        background: Rectangle {
            width: parent.width
            color: "transparent"
            border.color: "#21be2b"
            radius: 10
        }

        label: Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: -height/2
            color: "black"                  //set this to the background color
            width: parent.width * 0.35
            height: dataPlotTitle.font.pixelSize
            Text {
                id: dataPlotTitle
                text: qsTr("Data Plots")
                anchors.centerIn: parent
                font.pixelSize: 32
                color: "white"
            }
        }

        Column{
            //First of two columns that are in this GroupBox
            id: plotCol1
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            spacing: 10
            Button{
                //Button to plot individual cell voltages
                id: cellVPButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                Text{
                    id: cellVPLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Cell Voltages"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: cellVPButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }

            Button{
                //Button to plot battery voltage
                id: battVButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                Text{
                    id: battVLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Battery Voltages"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: battVButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }
        }
        Column{
            //This is the second column in this GroupBox and is aligned to the right of the first
            anchors.left: plotCol1.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            spacing: 10
            Button{
                //Button to plot battery temperatures
                id: battTempButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                Text{
                    id: battTempLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "Battery Temps"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: battTempButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }

            Button{
                //Button to plot SoC
                id: socButton
                font.pixelSize: 20
                font.bold: true
                font.family: "Eurostile"
                Text{
                    id: socLabel
                    anchors.fill: parent
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Eurostile"
                    color: "white"
                    text: "State of Charge"
                }
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 75
                    radius: 10
                    color: socButton.down ? Qt.darker("grey",1.5) : "grey"
                    border.color: "#26282a"
                    border.width: 1

                }
            }


        }

    }
    Button{
        //Button to change charging mode to "Fast"
        //The button goes darker and has an "orange-red" border when active
        id: fChargeButton
        anchors.left: dataPlotGroup.left
        anchors.leftMargin: 30
        anchors.top: dataPlotGroup.bottom
        anchors.topMargin: 10
        onPressed: {dashdata.chargeMode = 1;}
        //pressed: true
        Text{
            id: fChargeLabel
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            wrapMode: Text.WordWrap
            color: "white"
            text: "Fast Charging"
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 75
            radius: 10
            color: chargeMode ? Qt.darker("grey",1.5) : "grey"
            border.color: chargeMode ? "orangered" :"#26282a"
            border.width: 5

        }

    }
    Button{
        //Button to change charging mode to slow
        //The button goes darker and has an "orange-red" border when active
        id: sChargeButton
        anchors.left: fChargeButton.right
        anchors.leftMargin: 0
        anchors.top: dataPlotGroup.bottom
        anchors.topMargin: 10
        onPressed: {dashdata.chargeMode = 0;}
        Text{
            id: sChargeLabel
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            wrapMode: Text.WordWrap
            color: "white"
            text: "Slow Charging"
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 75
            radius: 10
            color: chargeMode ? "grey" : Qt.darker("grey",1.5)
            border.color: chargeMode? "#26282a": "orangered"
            border.width: 5

        }
    }
    Button{
        //Button to toggle the charing door open or closed
        //The border colour and text change depending on the state of the door
        id: doorButton
        anchors.right: dataPlotGroup.right
        anchors.rightMargin: 30
        anchors.top: dataPlotGroup.bottom
        anchors.topMargin: 10
        onPressed: {dashdata.doorState++}
        Text{
            id: doorLabel
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            wrapMode: Text.WordWrap
            color: "white"
            text: "Charging Door: " + (door? "Open":"Closed")
        }
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 75
            radius: 10
            color: door ? "grey" : Qt.darker("grey",1.5)
            border.color: door? "blue": "orangered"
            border.width: 5

        }
    }
}
