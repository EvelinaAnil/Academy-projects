#ifndef VILATION_H
#define VILATION_H
#include<QString>
#include <QDate>
#include<iostream>
using namespace std;
class Vilation
{
protected:
    QString driver;
    QDate date;
    QString info;
    float fine;

public:
    Vilation(    QString driver,
    QDate date,
    QString info,
    float fine);
Vilation(QString line);

    void setDriver(QString driver);
    QString getDriver()const;

    void setDate(QDate date);
    QDate getDate()const;

    void setInfo(QString info);
    QString getInfo()const;

    void setFine(float fine);
    float getFine()const;

    QString tostring()const;

};

#endif // VILATION_H
