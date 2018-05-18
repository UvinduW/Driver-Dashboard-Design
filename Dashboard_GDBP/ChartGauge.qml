import QtQuick 2.0
import QtCharts 2.2
import QtGraphicalEffects 1.0

// This file combines the SpeedGauge and PowerGauge and adds text to show actual values
// Also adds the driving tips text at the bottom of the gauges
Rectangle{
    color: "transparent"
    property int chartWidth
    property alias chartHeight: sGauge.height
    property alias chartLeft: sGauge.left
    height:  sGauge.width + txtTip.height
    width:  sGauge.height
    SpeedGauge{
        //Imports this from SpeedGauge file
        id:sGauge
        circleWidth: chartWidth
    }

    PowerGauge{
        //Imports this from the PowerGauge file
        id:pGauge
        anchors.centerIn: sGauge
        circleWidth: chartWidth
    }
    Text {
        //Driving tip - not fully implemented yet
        anchors.top: sGauge.bottom
        anchors.topMargin: -20
        anchors.horizontalCenter: sGauge.horizontalCenter
        id: txtTip
        font.pixelSize: 20
        font.bold: true
        font.family: "Eurostile"
        color: "white"
        text: qsTr("Reduce speed to " + 40 + " km/h")
    }
    Text{
        //Display speed at the centre of the gauge
        id: txtSpeed
        anchors.centerIn: sGauge
        anchors.verticalCenterOffset: -50
        font.pixelSize: 30
        font.bold: true
        font.family: "Eurostile"
        color: "blue"
        text: dashdata.speed + " km/h"
        z:1
    }
    Text{
        //Display power at the centre of the gauge
        id: txtPower
        anchors.centerIn: sGauge
        anchors.verticalCenterOffset: 50
        font.pixelSize: 30
        font.bold: true
        font.family: "Eurostile"
        color: "green"
        text: dashdata.power + " kW"
        z:1
    }
    Rectangle{
        //A circle in the middle of the gauges with a white/black background
        //The speed and power text will be laid over this circle
        id: fillRect
        width: chartWidth*0.5
        height: width
        radius: width*0.5 //This creates a circle out of the QML Rectangle type
        color: "orangered"
        anchors.centerIn: sGauge
        LinearGradient {
            //Produce gradient to give the white and black sections
            anchors.fill: parent
            source: fillRect
            start: Qt.point(0, 0)
            end: Qt.point(0, 300)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "white" }
                GradientStop { position: 0.34; color: "white" }
                GradientStop { position: 0.35; color: "black" }
                GradientStop { position: 1.0; color: "black" }
            }
        }
    }
}
