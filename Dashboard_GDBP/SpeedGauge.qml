import QtQuick 2.0
import QtCharts 2.2

ChartView {
    property alias circleWidth: speedChart.height
    id: speedChart
    width: height
    legend.visible: false
    antialiasing: true
    backgroundColor: "transparent"

    PieSeries {
        id: speedOuter
        size: 1.5
        holeSize: 0.5
        startAngle: 180
        endAngle: 360
        PieSlice { id: speedslice; value: dashdata.speed; color: "red"; borderColor: "transparent" }
        PieSlice { id: black2; value: 100-dashdata.speed; color: "blue"; borderColor: "transparent" }
    }
}
