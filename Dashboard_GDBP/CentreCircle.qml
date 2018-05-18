import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2

//This file is no longer used
//Included in the submisssion to ensure the file manifest does not produce any errors
Item{
    ChartView {
        property alias circleWidth: chart.height
        id: chart
        width: height
        legend.visible: false
        antialiasing: false
        backgroundColor: "transparent"

        PieSeries {
            id: pieOuter
            size: 1.5
            holeSize: 0.5
            startAngle: 180
            endAngle: 360
            PieSlice { id: speedslice; value: 50; color: "red"; borderColor: "transparent" }
            PieSlice { id: black2; value: 50; color: "blue"; borderColor: "transparent" }
        }
    }
    ChartView {
        property alias circleWidth: powerChart.height
        id: powerChart
        anchors.left: chart.right
        width: height
        legend.visible: false
        antialiasing: false
        backgroundColor: "transparent"

        PieSeries {
            id: powerOuter
            size: 1.5
            holeSize: 0.5
            startAngle: 180
            endAngle: 0
            PieSlice { id: asd; value: 50; color: "red"; borderColor: "transparent" }
            PieSlice { id: ass; value: 50; color: "blue"; borderColor: "transparent" }
        }
    }
}
