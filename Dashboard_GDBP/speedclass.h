#ifndef SPEEDCLASS_H
#define SPEEDCLASS_H

#include <QObject>
#include <QTimer>

class speedclass : public QObject
{
    Q_OBJECT

public:
    speedclass();
    Q_PROPERTY( int speed READ speedR NOTIFY speedChanged)
    int speedR(){ return this -> m_speed;}

signals:
    void speedChanged();

private slots:
    void updateSpeed();

private:
    int m_speed;
    int increasing;
    QTimer * m_timer;
};

#endif // SPEEDCLASS_H
