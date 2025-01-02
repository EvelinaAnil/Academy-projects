#include "dialogaddcustumer.h"
#include "ui_dialogaddcustumer.h"

DialogAddCustumer::DialogAddCustumer(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogAddCustumer)
{
    ui->setupUi(this);
}

DialogAddCustumer::~DialogAddCustumer()
{
    delete ui;
}
