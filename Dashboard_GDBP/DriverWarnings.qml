import QtQuick 2.0
import QtQuick.Layouts 1.3

//Displays the 4 different warning to the user, when applicable

Item {
    property int sizeFactor:20 // used to resize all elements as the warnings are different size in the different system modes
    property int fontSize: sizeFactor*1.5
    property int recWidth: sizeFactor*2.5
    property int totalWidth: battCircle.width + damageText.width+5
    property int totalHeight: battCircle.height*4 + sizeFactor*4
    // The warnings are laid out in a column with each element employing a RowLayout
    // to align the circle and text together
    // The visibility of each warning depends on the mode the system is in. In Driver Mode
    // only active warning are displayed, while in Maintenace Mode, all of them are displayed
    // with the inactive ones greyed out
    ColumnLayout{
        spacing: sizeFactor
        RowLayout{
            //Battery low warning
            visible: {
                // Visible if in MaintenanceMode, hidden if in driver mode
                if (dashdata.swipeIndex === 0 && dashdata.battLow === false)
                {
                    return false
                }
                else
                {
                    return true
                }
            }
            Rectangle{
                id: battCircle
                width: recWidth
                height: width
                // Colour greyed out if inactive
                color: dashdata.battLow? "red":"grey"
                border.color: "blue"
                border.width: 1
                radius: width*0.5
            }
            Text {
                id: battText
                font.pixelSize: fontSize
                font.bold: true
                font.family: "Eurostile"
                // Colour greyed out if inactive
                color: dashdata.battLow? "white":"grey"
                text: "BATTERY LOW"
            }
        }


        RowLayout{
            //High temperature warning
            visible: {
                // Visible if in MaintenanceMode, hidden if in driver mode
                if (dashdata.swipeIndex === 0 && dashdata.battTempHigh === false)
                {
                    return false
                }
                else
                {
                    return true
                }
            }
            Rectangle{
                width: recWidth
                height: width
                // Colour greyed out if inactive
                color: dashdata.battTempHigh? "red":"grey"
                border.color: "blue"
                border.width: 1
                radius: width*0.5

            }
            Text {
                font.pixelSize: fontSize
                font.bold: true
                font.family: "Eurostile"
                // Colour greyed out if inactive
                color: dashdata.battTempHigh? "white":"grey"
                text: "HIGH TEMP"
            }
        }



        RowLayout{
            //Battery damage warning
            visible: {
                // Visible if in MaintenanceMode, hidden if in driver mode
                if (dashdata.swipeIndex === 0 && dashdata.battDamaged === false)
                {
                    return false
                }
                else
                {
                    return true
                }
            }
            Rectangle{
                width: recWidth
                height: width
                // Colour greyed out if inactive
                color: dashdata.battDamaged? "red":"grey"
                border.color: "blue"
                border.width: 1
                radius: width*0.5
            }
            Text {
                id: damageText
                font.pixelSize: fontSize
                font.bold: true
                font.family: "Eurostile"
                // Colour greyed out if inactive
                color: dashdata.battDamaged? "white":"grey"
                text: "BATTERY DAMAGE"
            }
        }



        RowLayout{
            //Serive warning
            visible: {
                // Visible if in MaintenanceMode, hidden if in driver mode
                if (dashdata.swipeIndex === 0 && dashdata.service === false)
                {
                    return false
                }
                else
                {
                    return true
                }
            }
            Rectangle{
                width: recWidth
                height: width
                // Colour greyed out if inactive
                color: dashdata.service? "red":"grey"
                border.color: "blue"
                border.width: 1
                radius: width*0.5
            }
            Text {
                font.pixelSize: fontSize
                font.bold: true
                font.family: "Eurostile"
                // Colour greyed out if inactive
                color: dashdata.service? "white":"grey"
                text: "SERVICE"
            }
        }
    }
}
