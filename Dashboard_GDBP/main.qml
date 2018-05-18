import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    title: qsTr("Dashing Boi")
    color: "black"
    SwipeView {
        //Allows multiple screens to be used, with a swipe used to change between them
        id: swipeView
        property int cstate: dashdata.swipeIndex
        anchors.fill: parent
        anchors.leftMargin: 5
        onCstateChanged: console.log(cstate) //print current screen index to terminal for debugging
        onCurrentIndexChanged: dashdata.swipeIndex = swipeView.currentIndex
        DriverMode2 {
            //Display the driver mode at the left most
            visible: true
        }

        MaintenanceMode{
            //Maintenace mode is in the centre - swipe left from driver mode to get here
            id: mMode


        }
        Item {
            //This will hold the requested Chart
            //A loder is used to load different charts depending on the user's request
            width: 1280; height: 800
            Loader {
                id: pageLoader
                anchors.fill: parent
                source: mMode.chartName
            }
        }

    }

}
