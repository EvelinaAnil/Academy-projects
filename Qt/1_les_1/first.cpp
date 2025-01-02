#include "ui_first.h"
#include "first.h"

First::First(QWidget *parent)
    : QMainWindow(parent)
    , ui(new First)
{
    ui->setupUi(this);

    int x=2,x2=9;
    int n1=rand()%(x2-x+1)+x;
    int n2=rand()%(x2-x+1)+x;

    ui->number1->setNum(n1);
    ui->number2->setNum(n2);
}

First::~First()
{
    delete ui;
}

