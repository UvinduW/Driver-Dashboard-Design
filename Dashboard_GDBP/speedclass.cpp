#include "speedclass.h"

speedclass::speedclass():m_speed(0), increasing(1)
{
    this->m_timer = new QTimer(this);
    this->m_timer->setInterval(100);
    connect(this->m_timer,&QTimer::timeout,this,&speedclass::updateSpeed);
    this->m_timer->start();

}

void speedclass::updateSpeed()
{
    if (this->m_speed >= 100)
    {
        this->increasing = 0;
    }
    else if (this->m_speed <= 0)
    {
        this->increasing = 1;
    }

    if (this->increasing == 1)
    {
        this->m_speed += 1;
    }
    else
    {
        this->m_speed -= 1;
    }

    emit speedChanged();
}
