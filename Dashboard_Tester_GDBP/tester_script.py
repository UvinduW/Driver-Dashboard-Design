import socket
import sys
from PyQt5 import QtCore, QtGui, uic, QtWidgets  # PyQt 5.9 library was used (5.6 might also work)

# Usage:
# Run this script first
# Click on the Listen button
# Interface will now become unresponsive
# Now run the QML GUI app, and it will connect to the socket created in this script
# Interface will become responsive again and can be used to give GUI input
# Note: Error handling has not been implemented, so if the above procedure is not followed, script may crash

# Skeleton code was used for reference from: http://pythonforengineers.com/your-first-gui-app-with-python-and-pyqt/


qtCreatorFile = "dash_tester.ui"  # Open .ui file created with QtWidgets - this is the GUI for this tester program

Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)


class MyApp(QtWidgets.QMainWindow, Ui_MainWindow):
    gui_socket = 0  # Global variable to hold the socket object of the client

    def __init__(self):

        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)

        # Connect the events of each of the elements on the interface to a function in this class
        #  which will be called when that event occurs
        self.btnStart.clicked.connect(self.connect_socket)
        self.hsbSpeed.valueChanged.connect(self.speed_changed)
        self.hsbPower.valueChanged.connect(self.power_changed)
        self.hsbSoc.valueChanged.connect(self.soc_changed)
        self.hsbRange.valueChanged.connect(self.range_changed)
        self.hsbTrip.valueChanged.connect(self.trip_changed)
        self.chkBattery.stateChanged.connect(self.battery_warning)
        self.chkTemp.stateChanged.connect(self.temp_warning)
        self.chkDamage.stateChanged.connect(self.damage_warning)
        self.chkService.stateChanged.connect(self.service_warning)
        self.optEco.clicked.connect(self.eco_mode)
        self.optNormal.clicked.connect(self.normal_mode)
        self.optSport.clicked.connect(self.sport_mode)
        self.optOffRoad.clicked.connect(self.offroad_mode)
        self.optOpen.clicked.connect(self.open_door)
        self.optClose.clicked.connect(self.close_door)
        self.optFast.clicked.connect(self.fast_charge)
        self.optSlow.clicked.connect(self.slow_charge)
        self.hsbBVoltage.valueChanged.connect(self.battv_changed)
        self.hsbBTemp.valueChanged.connect(self.battt_changed)
        self.hsbC1.valueChanged.connect(self.cell1_changed)
        self.hsbC2.valueChanged.connect(self.cell2_changed)
        self.hsbC3.valueChanged.connect(self.cell3_changed)
        self.hsbC4.valueChanged.connect(self.cell4_changed)
        self.hsbC5.valueChanged.connect(self.cell5_changed)
        self.hsbC6.valueChanged.connect(self.cell6_changed)
        self.hsbC7.valueChanged.connect(self.cell7_changed)
        self.hsbC8.valueChanged.connect(self.cell8_changed)

    # The functions given below are called when their corresponding event was performed on the tester GUI
    # string.zfill() function used to pad data with upto 3 leading zeros to ensure data is always 3 characters long
    def cell8_changed(self):
        global gui_socket
        val = self.hsbC8.value()
        gui_socket.send("24" + str(val).zfill(3))

    def cell7_changed(self):
        global gui_socket
        val = self.hsbC7.value()
        gui_socket.send("23" + str(val).zfill(3))

    def cell6_changed(self):
        global gui_socket
        val = self.hsbC6.value()
        gui_socket.send("22" + str(val).zfill(3))

    def cell5_changed(self):
        global gui_socket
        val = self.hsbC5.value()
        gui_socket.send("21" + str(val).zfill(3))

    def cell4_changed(self):
        global gui_socket
        val = self.hsbC4.value()
        gui_socket.send("20" + str(val).zfill(3))

    def cell3_changed(self):
        global gui_socket
        val = self.hsbC3.value()
        gui_socket.send("19" + str(val).zfill(3))

    def cell2_changed(self):
        global gui_socket
        val = self.hsbC2.value()
        gui_socket.send("18" + str(val).zfill(3))

    def cell1_changed(self):
        global gui_socket
        val = self.hsbC1.value()
        gui_socket.send("17" + str(val).zfill(3))

    def battt_changed(self):
        global gui_socket
        val = self.hsbBTemp.value()
        gui_socket.send("14" + str(val).zfill(3))

    def battv_changed(self):
        global gui_socket
        val = self.hsbBVoltage.value()
        gui_socket.send("16" + str(val).zfill(3))

    def slow_charge(self):
        global  gui_socket
        gui_socket.send("31000")

    def fast_charge(self):
        global  gui_socket
        gui_socket.send("31001")

    def close_door(self):
        global  gui_socket
        gui_socket.send("30000")

    def open_door(self):
        global  gui_socket
        gui_socket.send("30001")

    def offroad_mode(self):
        global gui_socket
        gui_socket.send("29003")

    def sport_mode(self):
        global gui_socket
        gui_socket.send("29002")

    def normal_mode(self):
        global gui_socket
        gui_socket.send("29000")

    def eco_mode(self):
        global gui_socket
        gui_socket.send("29001")

    def service_warning(self):
        global gui_socket
        val = int(self.chkService.isChecked())
        gui_socket.send("28" + str(val).zfill(3))

    def damage_warning(self):
        global gui_socket
        val = int(self.chkDamage.isChecked())
        gui_socket.send("27" + str(val).zfill(3))

    def temp_warning(self):
        global gui_socket
        val = int(self.chkTemp.isChecked())
        gui_socket.send("26" + str(val).zfill(3))

    def battery_warning(self):
        global gui_socket
        val = int(self.chkBattery.isChecked())
        gui_socket.send("25" + str(val).zfill(3))

    def trip_changed(self):
        global gui_socket
        val = self.hsbTrip.value()
        gui_socket.send("15" + str(val).zfill(3))

    def range_changed(self):
        global gui_socket
        val = self.hsbRange.value()
        gui_socket.send("13" + str(val).zfill(3))

    def soc_changed(self):
        global gui_socket
        val = self.hsbSoc.value()
        gui_socket.send("12" + str(val).zfill(3))

    def power_changed(self):
        global gui_socket
        val = self.hsbPower.value()
        gui_socket.send("11" + str(val).zfill(3))

    def speed_changed(self):
        global gui_socket
        val = self.hsbSpeed.value()
        print ("10"+str(val).zfill(3))
        gui_socket.send("10"+str(val).zfill(3))

    def connect_socket(self):
        # This function sets up the socket and starts listening for clients
        global gui_socket
        # Listen on all interfaces on port 8000
        ip_address = "0.0.0.0"
        port = 8000

        # Create a socket object (UDP) for message transmission.
        socket_control = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # Bind the IP and port to the socket object.
        socket_control.bind((ip_address, port))
        socket_control.listen(0)  # wait for client
        gui_socket, addr = socket_control.accept()
        print "Accepted"
        # An initial message sent for testing purposes - should set the speed on the QML GUI to 85 km/h
        gui_socket.send("10085")



if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MyApp()
    window.show()
    sys.exit(app.exec_())

