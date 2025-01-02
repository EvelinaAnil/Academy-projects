#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFile>
#include <QTextStream>>
#include <QMessageBox>
#include <QDebug>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    LoadData();
    qDebug()<<base.size();
    showVilations_to_Table();
    ui->dateEdit->setDate(QDate::currentDate());
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::LoadData()
{
QFile file("data.txt");
if(file.open(QIODevice::ReadOnly|QIODevice::Text)){
    QTextStream read(&file);
    while(!read.atEnd()){
        QString text=read.readLine();
        try {
            base.push_back(new Vilation(text));
        } catch (const char* s) {
            QMessageBox::warning(this,"Create obj!","Load ERROR!!"+QString(s));


        }
    }file.close();
}
}
void MainWindow::showVilations_to_Table(){
ui->tableWidget->setRowCount(base.size());
for(int i=0;i<base.size();i++){
    //4 cells for every
    QTableWidgetItem* item_name=new QTableWidgetItem();
     QTableWidgetItem* item_date=new QTableWidgetItem();

       QTableWidgetItem* item_info=new QTableWidgetItem();
       QTableWidgetItem* item_fine=new QTableWidgetItem();

       //input info in cells
       item_name->setText(base[i]->getDriver());
       item_date->setText(base[i]->getDate().toString("dd.MM.yyyy"));

       item_info->setText(base[i]->getInfo());
       item_fine->setText(QString().setNum(base[i]->getFine())+"UA");

       //link cells and table
       ui->tableWidget->setItem(i,0,item_name);
       ui->tableWidget->setItem(i,1,item_date);
       ui->tableWidget->setItem(i,2,item_info);
       ui->tableWidget->setItem(i,3,item_fine);

}
}

void MainWindow::on_pushButton_clicked()
{
    QString name=ui->lineEdit->text();
    QDate date=ui->dateEdit->date();
    QString info=ui->lineEdit_2->text();
    float fine=ui->doubleSpinBox->value();

    Vilation* obj =new Vilation(name,date,info,fine);
    base.push_back(obj);
    QFile file("data.txt");
    if(file.open(QIODevice::WriteOnly|QIODevice::Text|QIODevice::Append)){
         QTextStream write(&file);
            write<<"\n"<<obj->tostring();
            file.close();
    }
    ui->tableWidget->setRowCount(base.size());
    //4 cells for every
    QTableWidgetItem* item_name=new QTableWidgetItem();
     QTableWidgetItem* item_date=new QTableWidgetItem();

       QTableWidgetItem* item_info=new QTableWidgetItem();
       QTableWidgetItem* item_fine=new QTableWidgetItem();

    //input info in cells
    item_name->setText(obj->getDriver());
    item_date->setText(obj->getDate().toString("dd.MM.yyyy"));

    item_info->setText(obj->getInfo());
    item_fine->setText(QString().setNum(obj->getFine())+"UA");

    //link cells and table
    ui->tableWidget->setItem(base.size()-1,0,item_name);
    ui->tableWidget->setItem(base.size()-1,1,item_date);
    ui->tableWidget->setItem(base.size()-1,2,item_info);
    ui->tableWidget->setItem(base.size()-1,3,item_fine);
    QMessageBox::about(this,"Add ","Sucsessful");
}

