import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

//A horizontal progress bar used as the trip meter

Rectangle{
    id:tripbox
    property alias boxwidth: tripbox.width
    property alias boxheight: tripbox.height

    property alias tripWidth: tripOutline.implicitWidth
    height: tripOutline.height
    width: tripOutline.width+imTime.width
    color: "transparent"
    Image {
        anchors.left: tripOutline.right
        anchors.verticalCenter: tripOutline.verticalCenter
        height: tripOutline.height
        width: tripOutline.height
        id: imTime
        source: "Graphics/TimeIcon.png"
    }

    Rectangle{
        //Outline of the bar
        id: tripOutline        
        height: 0.3*width
        implicitWidth: implicitHeight*0.3
        border.color: "red"
        border.width: 2
        Rectangle{
            //Iner fill of the bar
            id: tripFill
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: parent.border.width
            anchors.bottomMargin: parent.border.width
            anchors.topMargin: parent.border.width
            width: (parent.width-2*parent.border.width)*dashdata.tripMeter/100
            color: "deepskyblue"

        }
        Text{
            //Text showing actual distance driven
            id: txtTrip
            anchors.fill: parent
            font.pixelSize: 35
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "black"
            //Note - in final implementation, the source for the "inner-fill" above and the
            //source for the text will not be the same as the fill shows how much battery
            //was used while the text shows how far the vehicle has been driven
            text: dashdata.tripMeter + " km"
        }
    }
}

