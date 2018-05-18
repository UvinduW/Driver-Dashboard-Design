import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

//This is the screen seen after startup, showing the Driver Mode elements

Item {
    id: dmode
    property int driveMode: dashdata.driveMode
    property int doorState: dashdata.doorState
    property int chargeMode: dashdata.chargeMode
    property int range: parent.width;
    DriverWarnings{
        //Load warnings from DriverWarnings file
        id: warning
    }

    RowLayout{
        // A row that just holds the Range text
        id: rangeRow
        width: parent.width
        Layout.fillWidth: true
        anchors.top: parent.top
        anchors.topMargin: 170

        Text {

            Layout.alignment: Qt.AlignCenter
            id: txtRange
            font.pixelSize: 50
            font.bold: true
            font.family: "Eurostile"
            color: "white"
            text: qsTr("Range " + dashdata.range + " km")
        }
    }
    RowLayout{
        // Middle row that holds the SoC indicator, gauges, battery temp and tripmeter
        id: middleRow
        anchors.top: rangeRow.bottom
        anchors.left: warning.right
        anchors.topMargin: 20
        width: parent.width
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignCenter

        Rectangle{
            // A rectangle used to encapsulate multiple elements to ease with alignment
            id: mainbox
            Layout.preferredWidth: dmode.width/3
            Layout.alignment: Qt.AlignCenter
            border.color: "white"
            SocBar{
                // Load the state of charge bar
                id: soc
                socHeight: centreGauge.chartHeight-100
                anchors.right: centreGauge.left
                anchors.topMargin: 50
            }
            ChartGauge{
                //Load the file which has the combined gauges
                id: centreGauge
                chartWidth: dmode.width/3
            }
            TripTempBox{
                //Load the file which has the battery temperature and tripmeter indicators
                id: triptemp
                anchors.left: centreGauge.right
                anchors.verticalCenter: centreGauge.verticalCenter
                boxWidth: centreGauge.chartWidth/2
            }

            Rectangle{
                //This rectangle holds the three buttons seen at the bottom of the screen
                implicitWidth: parent.width
                anchors.top: centreGauge.bottom
                anchors.horizontalCenter: centreGauge.horizontalCenter
                height: ecoButton.height
                width: ecoButton.width*3+20
                color: "transparent"

                Button{
                    // Button to change driving mode (Eco, Normal, Sport, Off-Roaf)
                    id: ecoButton
                    property int nums: 0
                    onPressed: {dashdata.driveMode++} //increment drive mode on button press
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 75
                        radius: 10
                        color: ecoButton.down ? Qt.darker("grey",1.5) : "grey" //change colour if pressed
                        border.color: "#26282a"
                        border.width: 1

                    }
                    Text{
                        id: ecoLabel
                        anchors.fill: parent
                        font.pixelSize: 20
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Eurostile"
                        color: "white"
                        // Change displayed text depending on the current Driving Mode
                        text: "Driving Mode: " + (driveMode==0? "Normal": driveMode==1? "   Eco": driveMode==2? "Sport": "   Off-Road")
                        wrapMode: Text.WordWrap
                    }
                }
                Button{
                    // Button to open/close charing door
                    id: doorButton
                    property int nums: 0
                    anchors.left: ecoButton.right
                    anchors.leftMargin: 10
                    onPressed: {dashdata.doorState++} //increment door state on button press
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 75
                        radius: 10
                        color: doorButton.down ? Qt.darker("grey",1.5) : "grey"
                        border.color: "#26282a"
                        border.width: 1

                    }
                    Text{
                        id: doorLabel
                        anchors.fill: parent
                        font.pixelSize: 20
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Eurostile"
                        color: "white"
                        // Change displayed text depending on door state
                        text: "Charging Door: " + (doorState? "Open":"Closed")
                        wrapMode: Text.WordWrap
                    }
                }
                Button{
                    //Button to change charging mode
                    id: chargeButton
                    property int nums: 0
                    anchors.left: doorButton.right
                    anchors.leftMargin: 10
                    onPressed: {dashdata.chargeMode++} //increment chargine mode on press
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 75
                        radius: 10
                        color: chargeButton.down ? Qt.darker("grey",1.5) : "grey"
                        border.color: "#26282a"
                        border.width: 1

                    }
                    Text{
                        id: cModeLabel
                        anchors.fill: parent
                        font.pixelSize: 20
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Eurostile"
                        color: "white"
                        // Change displayed text depending on charging mode
                        text: "Charging Mode: " + (chargeMode? "Fast":"Slow")
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }



}
