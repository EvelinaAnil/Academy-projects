#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSqlQuery>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    formCust=new DialogAddCustumer();
    //connect
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./pharm.db");

    if(db.open()){
        vipClients();
        ui->statusbar->showMessage("open");
        OrderByLastMonth();
    }
    else{
        ui->statusbar->showMessage("no open");
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::OrderByLastMonth()
{
    QSqlQuery* obj =new QSqlQuery();
obj->exec(" SELECT name, title, date_order, amount"
         " FROM [Customer], [Medicine],[Order]"
          " WHERE [Customer].id_customer=[Order].id_client AND [Medicine].id_medicine=[order].id_med"
          " AND strftime('%m', [Order].date_order)=strftime('%m', DATE('now', '-1 month'))");
                //обработка zapros
int i=0;
            while(obj->next()){
                QString name=obj->value(0).toString();
                QString title=obj->value(1).toString();
                QString date=obj->value(2).toString();
                int amount=obj->value(3).toInt();

                    ui->tableWidget->setRowCount(i+1);
                    QTableWidgetItem* cellName = new QTableWidgetItem();
                    QTableWidgetItem* cellTitle = new QTableWidgetItem();
                    QTableWidgetItem* cellDate = new QTableWidgetItem();
                    QTableWidgetItem* cellAmount = new QTableWidgetItem();



                    cellName->setText(name);
                    cellTitle->setText(title);
                    cellDate->setText(date);
                    cellAmount->setText(QString().setNum(amount));



                    ui->tableWidget->setItem(i, 0, cellName);
                    ui->tableWidget->setItem(i, 1, cellTitle);
                    ui->tableWidget->setItem(i, 2, cellDate);
                    ui->tableWidget->setItem(i, 3, cellAmount);
                    i++;
            }

}

void MainWindow::vipClients()
{
    QSqlQuery* obj = new QSqlQuery();
        obj->exec(" SELECT *"
                  " FROM Customer"
                  " WHERE [Customer].sale > 20");

        int i = 0;
        while(obj->next())
        {
            QString id = obj->value(0).toString();
            QString customer = obj->value(1).toString();
            QString sale = obj->value(2).toString();
            QString date = obj->value(3).toString();

            ui->tableWidget_2->setRowCount(i+1);


            QTableWidgetItem* cellId = new QTableWidgetItem();
            QTableWidgetItem* cellCustomer = new QTableWidgetItem();
            QTableWidgetItem* cellsale = new QTableWidgetItem();
            QTableWidgetItem* cellDate = new QTableWidgetItem();

            cellId->setText(id);
            cellCustomer->setText(customer);
            cellsale->setText(sale);
            cellDate->setText(date);

            ui->tableWidget_2->setItem(i, 0, cellId);
            ui->tableWidget_2->setItem(i, 1, cellCustomer);
            ui->tableWidget_2->setItem(i, 2, cellsale);
            ui->tableWidget_2->setItem(i, 3, cellDate);
            i++;
        }
}


void MainWindow::on_pushButton_clicked()
{
    formCust->show();
}

