#include "vilation.h"






Vilation::Vilation(QString driver, QDate date, QString info, float fine)
{
this->driver=driver;
    this->date=date;
this->info=info;
    this->fine=fine;



}

Vilation::Vilation(QString line)
{
//"Ivanov I.I=04.04.2020=speed=1200"
    if(line.length()<14){
        throw"Wrong line!!";
    }
    QStringList items=line.split("=");
    //items[0]="Ivanov" , items[1]="04.04.2020" ,
    //items[2]=speed , items[3]=1200
    if(items.size()!=4){
        throw"Wrong line!!";
    }
    this->driver=items[0];
    this->date=QDate::fromString(items[1], "dd.MM.yyyy");
    this->info=items[2];
    this->fine=items[3].toFloat();
}
void Vilation:: setDriver(QString driver){
    this->driver=driver;
}
QString Vilation::getDriver() const
{
return driver;
}

void Vilation::setDate(QDate date)
{
this->date=date;
}

void Vilation::setInfo(QString info)
{
this->info=info;
}

QString Vilation::getInfo() const
{
return info;
}

void Vilation::setFine(float fine)
{
    this->fine=fine;
}

float Vilation::getFine() const
{
return fine;
}
QDate Vilation::getDate()const{
    return date;
}

QString Vilation::tostring()const{
    return driver+"="+date.toString("dd.MM.yyyy")+"="+info+"="+QString().setNum(fine);
}
