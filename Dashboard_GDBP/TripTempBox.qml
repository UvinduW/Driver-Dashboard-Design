import QtQuick 2.0

//This file combines the temperature bar and tripmeter into one element for easier alignment in DriverMode screen

Rectangle{
    color: "transparent"
    width: 280
    height: 135
    property int boxWidth
    TempBar{
        id: tempBox
        tempWidth: boxWidth
    }
    TripBar{
        id: tripBox
        anchors.top: tempBox.bottom
        anchors.topMargin: boxWidth/3
        tripWidth: boxWidth
    }
}
