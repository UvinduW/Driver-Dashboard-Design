import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2

// Screen that displays data for each of the cells within a string in a subpack

Item {
    Button{
        //Back button
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
            text: "Back"
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
        // Groupbox to  hold the different filtering criteria
        id: filterGroup
        property int factor: 15
        anchors.top: settingsButton.bottom
        anchors.topMargin: 20
        height: cmbSubPack.height * 11
        width: cmbSubPack.width*1.5
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
            height: filterTitle.font.pixelSize
            Text {
                id: filterTitle
                text: qsTr("Filter")
                anchors.centerIn: parent
                font.pixelSize: 32
                color: "white"
            }
        }

        ComboBox{
            // Combobox to select subpack
            id: cmbSubPack
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            model: 6
            font.pixelSize: 20
            delegate: ItemDelegate {
                text: index + 1
            }
            displayText: "Subpack: " + (currentIndex + 1)
        }

        ComboBox{
            // Combobox to select string of cells
            id: cmbString
            anchors.top: cmbSubPack.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            model: 15
            font.pixelSize: 20
            delegate: ItemDelegate {
                text: index + 1
            }
            displayText: "String:     " + (currentIndex + 1)
        }

        Text{
            id: lblShow
            anchors.top: cmbString.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Eurostile"
            color: "white"
            text: "Show"
        }
        Button{
            //Button to highlight the cell with the maximum value
            // note: this functionality has not yet been implemented
            id: btnMax
            property int nums: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: lblShow.bottom
            anchors.topMargin: 10
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 75
                radius: 10
                color: btnMax.down ? Qt.darker("grey",1.5) : "grey"
                border.color: "#26282a"
                border.width: 1

            }
            Text{
                id: lblMax
                anchors.fill: parent
                font.pixelSize: 20
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Eurostile"
                color: "white"
                text: "Maximum"
                wrapMode: Text.WordWrap
            }
        }
        Button{
            //Button to highlight the cell with the minimum value
            // note: this functionality has not yet been implemented
            id: btnMin
            property int nums: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: btnMax.bottom
            anchors.topMargin: 10
            onPressed: {nums++}
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 75
                radius: 10
                color: btnMin.down ? Qt.darker("grey",1.5) : "grey"
                border.color: "#26282a"
                border.width: 1

            }
            Text{
                id: lblMin
                anchors.fill: parent
                font.pixelSize: 20
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Eurostile"
                color: "white"
                text: "Minimum"
                wrapMode: Text.WordWrap
            }
        }
        Button{
            //Button to show the average value
            // note: this functionality has not yet been implemented
            id: btnAvg
            property int nums: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: btnMin.bottom
            anchors.topMargin: 10
            onPressed: {nums++}
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 75
                radius: 10
                color: btnAvg.down ? Qt.darker("grey",1.5) : "grey"
                border.color: "#26282a"
                border.width: 1

            }
            Text{
                id: lblAvg
                anchors.fill: parent
                font.pixelSize: 20
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Eurostile"
                color: "white"
                text: "Average"
                wrapMode: Text.WordWrap
            }
        }

    }
    ChartView{
        //The chart that will display all the cell data
        anchors.left: filterGroup.right
        anchors.top: filterGroup.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        legend.visible: false
        BarSeries{
            //Barseries used to create a bar chart - showing values for each of the 8 cells
            axisX: BarCategoryAxis  {categories: ["Cell 1","Cell 2","Cell 3","Cell 4","Cell 5","Cell 6","Cell 7","Cell 8"]}
            axisY: ValueAxis {min: 0; max:4; titleText: "Voltage"}
            BarSet{values:[dashdata.cell1Voltage,dashdata.cell2Voltage,dashdata.cell3Voltage,dashdata.cell4Voltage,dashdata.cell5Voltage,dashdata.cell6Voltage,dashdata.cell7Voltage,dashdata.cell8Voltage]}
        }

    }
}
