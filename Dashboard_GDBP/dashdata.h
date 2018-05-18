#ifndef DASHDATA_H
#define DASHDATA_H

#include <QObject>
#include <QTimer>
#include <QTcpSocket>
#include <QDebug>


class DashData : public QObject
{
    //Import Q_OBJECT into class to allow the usage of Qt-specific functions
    Q_OBJECT
public:
    explicit DashData(QObject *parent = 0);
    //Setup the Q_PROPERTY macros for all the variables that QML will access

    //Read-Only Properties
    Q_PROPERTY(int speed READ speed NOTIFY speedChanged)
    Q_PROPERTY(int power READ power NOTIFY powerChanged)
    Q_PROPERTY(int soc READ soc NOTIFY socChanged)
    Q_PROPERTY(int range READ range NOTIFY rangeChanged)
    Q_PROPERTY(int battTemp READ battTemp NOTIFY battTempChanged)
    Q_PROPERTY(int tripMeter READ tripMeter NOTIFY tripMeterChanged)
    Q_PROPERTY(bool battLow READ battLow NOTIFY battLowChanged)
    Q_PROPERTY(bool battTempHigh READ battTempHigh NOTIFY battTempHighChanged)
    Q_PROPERTY(bool battDamaged READ battDamaged NOTIFY battDamagedChanged)
    Q_PROPERTY(bool service READ service NOTIFY serviceChanged)
    Q_PROPERTY(int battVoltage READ battVoltage NOTIFY battVoltageChanged)
    Q_PROPERTY(float cell1Voltage READ cell1Voltage NOTIFY cell1VoltageChanged)
    Q_PROPERTY(float cell2Voltage READ cell2Voltage NOTIFY cell2VoltageChanged)
    Q_PROPERTY(float cell3Voltage READ cell3Voltage NOTIFY cell3VoltageChanged)
    Q_PROPERTY(float cell4Voltage READ cell4Voltage NOTIFY cell4VoltageChanged)
    Q_PROPERTY(float cell5Voltage READ cell5Voltage NOTIFY cell5VoltageChanged)
    Q_PROPERTY(float cell6Voltage READ cell6Voltage NOTIFY cell6VoltageChanged)
    Q_PROPERTY(float cell7Voltage READ cell7Voltage NOTIFY cell7VoltageChanged)
    Q_PROPERTY(float cell8Voltage READ cell8Voltage NOTIFY cell8VoltageChanged)

    // Read functions
    int speed(){ return this -> m_speed;}
    int power(){ return this -> m_power;}
    int soc(){ return this -> m_soc;}
    int range(){ return this -> m_range;}
    int battTemp(){ return this -> m_battTemp;}
    int tripMeter(){ return this -> m_tripMeter;}
    bool battLow(){ return this -> m_battLow;}
    bool battTempHigh(){ return this -> m_battTempHigh;}
    bool battDamaged(){ return this -> m_battDamaged;}
    bool service(){ return this -> m_service;}
    int battVoltage(){ return this -> m_battVoltage;}
    float cell1Voltage(){ return this -> m_cell1Voltage;}
    float cell2Voltage(){ return this -> m_cell2Voltage;}
    float cell3Voltage(){ return this -> m_cell3Voltage;}
    float cell4Voltage(){ return this -> m_cell4Voltage;}
    float cell5Voltage(){ return this -> m_cell5Voltage;}
    float cell6Voltage(){ return this -> m_cell6Voltage;}
    float cell7Voltage(){ return this -> m_cell7Voltage;}
    float cell8Voltage(){ return this -> m_cell8Voltage;}

    //Read-Write Properties
    Q_PROPERTY(int driveMode READ driveMode WRITE setDriveMode NOTIFY driveModeChanged)
    Q_PROPERTY(int doorState READ doorState WRITE setDoorState NOTIFY doorStateChanged)
    Q_PROPERTY(int chargeMode READ chargeMode WRITE setChargeMode NOTIFY chargeModeChanged)

    //Read functions
    int driveMode(){ return this -> m_driveMode;}
    int doorState(){ return this -> m_doorState;}
    int chargeMode(){ return this -> m_chargeMode;}

    //Write functions
    void setDriveMode(int mode)
    {
        // If mode exceeds 3 (Off-Road Mode), reset to 0 (Normal Mode)
        if (mode > 3){mode=0;}
        this -> m_driveMode = mode;
        emit driveModeChanged();
    }
    void setDoorState(int state)
    {
        // If state exceeds 1 (door open), reset to 0 (door closed)
        if (state > 1){state=0;}
        this -> m_doorState = state;
        emit doorStateChanged();
    }
    void setChargeMode(int mode)
    {
        // If mode exceeds 1 (Fast-charge), reset to 0 (Slow-charge)
        if (mode > 1){mode=0;}
        this -> m_chargeMode = mode;
        emit chargeModeChanged();
    }

    //GUI-Related Properties
    Q_PROPERTY(int swipeIndex READ swipeIndex WRITE setSwipeIndex NOTIFY swipeIndexChanged)

    //Read Functions
    int swipeIndex(){return this -> m_swipeIndex;}

    //Write Functions
    void setSwipeIndex(int sIndex){this -> m_swipeIndex = sIndex; emit swipeIndexChanged();}



signals:
    // Signals that will be emited when the respective variables change
    void speedChanged();
    void powerChanged();
    void socChanged();
    void rangeChanged();
    void battTempChanged();
    void tripMeterChanged();
    void battLowChanged();
    void battTempHighChanged();
    void battDamagedChanged();
    void serviceChanged();
    void battVoltageChanged();
    void cell1VoltageChanged();
    void cell2VoltageChanged();
    void cell3VoltageChanged();
    void cell4VoltageChanged();
    void cell5VoltageChanged();
    void cell6VoltageChanged();
    void cell7VoltageChanged();
    void cell8VoltageChanged();

    void driveModeChanged();
    void doorStateChanged();
    void chargeModeChanged();

    void swipeIndexChanged();

private slots:
    // Internal functions

    // A temporary function used for testing
    void updateSpeed();

    //Socket Related

    //Connect to socket
    void socketConnect();

    //Disconnect from socket
    void socketDisconnect();

    //Send data over socket
    void sendData(char data[3]);

    //Receive data over socket
    void receiveData();

    //Process data received over socket to feed to the GUI
    void decodeData(std::string rawData);

private:
    // Internal variables to hold the data for different display elements

    //Read-Only
    int m_speed =0;
    int m_power =0;
    int m_soc   =50;
    int m_range =0;
    int m_battTemp=0;
    int m_tripMeter=0;
    bool m_battLow=0;
    bool m_battTempHigh=0;
    bool m_battDamaged=0;
    bool m_service=0;
    int m_battVoltage=0;
    float m_cell1Voltage=0;
    float m_cell2Voltage=0;
    float m_cell3Voltage=0;
    float m_cell4Voltage=0;
    float m_cell5Voltage=0;
    float m_cell6Voltage=0;
    float m_cell7Voltage=0;
    float m_cell8Voltage=0;

    //Read-Write
    int m_driveMode=0;
    int m_doorState=0;
    int m_chargeMode=0;

    //GUI-Related
    int m_swipeIndex;

    //Other Variables
    int data_length;
    int increasing;
    QTimer * m_timer;
    QTcpSocket *socket;
};

#endif // DASHDATA_H
