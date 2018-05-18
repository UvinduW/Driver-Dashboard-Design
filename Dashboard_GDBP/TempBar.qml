import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

//A horizontal progress bar showing the battery temperature
//The colour of the progress bar changes depengin on if it's cold, normal or hot

Rectangle{
    property alias boxwidth: tempbox.width
    property alias boxheight: tempbox.height

    property alias tempWidth: tempOutline.implicitWidth
    Rectangle{
        id:tempbox

        height: tempOutline.height
        width: tempOutline.width + imTemp.width

        color: "transparent"
        Image {
            anchors.left: tempOutline.right
            anchors.verticalCenter: tempOutline.verticalCenter
            height: tempOutline.height
            width: tempOutline.height
            id: imTemp
            source: "Graphics/TempIcon.png"
        }

        Rectangle{
            //Outer border of the progress bar
            id: tempOutline
            height: 0.3*width
            implicitWidth: implicitHeight*0.3
            border.color: "red"
            border.width: 2
            Rectangle{
                //Inner "filled" area of the progress bar
                id: tempLow
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: parent.border.width
                anchors.bottomMargin: parent.border.width
                anchors.topMargin: parent.border.width
                //Width depends on the current temperature
                width: (parent.width-2*parent.border.width)*(dashdata.battTemp+20)/100
                //Change colour of filled area such that it is blue if under 25; red if over 50; and green between those limits
                color: dashdata.battTemp>50? "red": dashdata.battTemp>25? "green": "deepskyblue"
            }


        }
    }

}
