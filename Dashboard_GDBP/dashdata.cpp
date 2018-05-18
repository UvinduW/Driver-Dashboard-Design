#include "dashdata.h"
#include <string.h>

DashData::DashData(QObject *parent):m_speed(0), m_swipeIndex(0),data_length(5), QObject(parent)
{
    // Timer used instead of continuous loop to prevent blocking and free-up system resources
    this->m_timer = new QTimer(this);
    this->m_timer->setInterval(10);
    //Every 10ms, the updateSpeed function will be called
    connect(this->m_timer,&QTimer::timeout,this,&DashData::updateSpeed);
    //Start the timer
    this->m_timer->start();
    //Connect to the server socket that will provide the data for this system
    DashData::socketConnect();
}

void DashData::updateSpeed()
{
    //Note: this function was created for debugging purposes and will be
    //      renamed to something more relevant in the next revision. This
    //      could not be done for the submission due to time-constraints.

    //Test data to send over socket
    char d[] = "abc\n";
    DashData::sendData(d);
    emit speedChanged();
    emit battTempHighChanged();
    emit battTempChanged();
}

void DashData::sendData(char data[3]){
    QString dd = data;
    std::string ddd = data;

    //Receive data over socket
    receiveData();

}

void DashData::receiveData()
{
    if (socket->bytesAvailable()>0)
    {
        // Read all bytes available on the socket
        std::string inps;
        QByteArray inp;
        inp = socket -> readAll();
        inps = inp.data();
        // Decode the data received over the socket
        decodeData(inps);
    }
}

void DashData::decodeData(std::string rawData)
{
    //From the data received over socket, figure out the "ID" and "Data"
    int id = atoi(rawData.substr(0,2).c_str());
    int data = atoi(rawData.substr(2,3).c_str());
    //Print to console
    qDebug() << rawData.c_str();

    //Use the ID to identify which quantity the message received was trying to change
    //Change this quantity and then emit the relevant signal to indicate to QML it has changed
    switch (id) {
    case 10:
        m_speed = data;
        emit speedChanged();
        break;

    case 11:
        m_power = data;
        emit powerChanged();
        break;

    case 12:
        m_soc = data;
        emit socChanged();
        break;

    case 13:
        m_range = data;
        emit rangeChanged();
        break;

    case 14:
        m_battTemp = data - 20;
        emit battTempChanged();
        break;

    case 15:
        m_tripMeter = data;
        emit tripMeterChanged();
        break;

    case 16:
        m_battVoltage = data;
        emit battVoltageChanged();
        break;

    case 17:
        m_cell1Voltage = data;
        emit cell1VoltageChanged();
        break;

    case 18:
        m_cell2Voltage = data;
        emit cell2VoltageChanged();
        break;

    case 19:
        m_cell3Voltage = data;
        emit cell3VoltageChanged();
        break;

    case 20:
        m_cell4Voltage = data;
        emit cell4VoltageChanged();
        break;

    case 21:
        m_cell5Voltage = data;
        emit cell5VoltageChanged();
        break;

    case 22:
        m_cell6Voltage = data;
        emit cell6VoltageChanged();
        break;

    case 23:
        m_cell7Voltage = data;
        emit cell7VoltageChanged();
        break;

    case 24:
        m_cell8Voltage = data;
        emit cell8VoltageChanged();
        break;

    case 25:
        m_battLow = data;
        emit battLowChanged();
        break;

    case 26:
        m_battTempHigh = data;
        emit battTempHighChanged();
        break;

    case 27:
        m_battDamaged = data;
        emit battDamagedChanged();
        break;

    case 28:
        m_service = data;
        emit serviceChanged();
        break;

    case 29:
        m_driveMode = data;
        emit driveModeChanged();
        break;

    case 30:
        m_doorState = data;
        emit doorStateChanged();
        break;

    case 31:
        m_chargeMode = data;
        emit chargeModeChanged();
        break;

    default:
        break;
    }
}

void DashData::socketDisconnect()
{
    //Disconnect the socket
    socket->close();
}

void DashData::socketConnect()
{
    //Connect to a socket on localhost over port 8000
    socket = new QTcpSocket(this);
    socket->connectToHost("127.0.0.1", 8000);

    if(socket->waitForConnected(3000))
    {
        qDebug() << "Connected!";
    }
    else
    {
        qDebug() << "Not connected!";
    }
}
