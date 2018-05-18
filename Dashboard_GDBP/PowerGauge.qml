import QtQuick 2.0
import QtCharts 2.2

ChartView {
    property alias circleWidth: powerChart.height
    id: powerChart
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
        PieSlice { id: speedslice; value: dashdata.power; color: "red"; borderColor: "transparent" }
        PieSlice { id: black2; value: 100-dashdata.power; color: "blue"; borderColor: "transparent" }
    }
}
