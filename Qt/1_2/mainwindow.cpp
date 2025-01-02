#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_radioButton_clicked()
{
    int x=ui->lineEdit->text().toInt();
    ui->lineEdit_2->setText(QString().setNum(x*8));
}


void MainWindow::on_radioButton_2_clicked()
{
    int x=ui->lineEdit->text().toInt();
    ui->lineEdit_2->setText(QString().setNum(x/1024.0));
}


void MainWindow::on_radioButton_3_clicked()
{
    int x=ui->lineEdit->text().toInt();
    ui->lineEdit_2->setText(QString().setNum(x/1024.0/1024));
}


void MainWindow::on_radioButton_4_clicked()
{
    int x=ui->lineEdit->text().toInt();
    ui->lineEdit_2->setText(QString().setNum(x/1024.0/1024/1024));
}


void MainWindow::on_lineEdit_textChanged(const QString &arg1)
{
    int x=ui->lineEdit->text().toInt();
    if(ui->radioButton->isChecked()){
         ui->lineEdit_2->setText(QString().setNum(x*8));
    }
   else if(ui->radioButton_2->isChecked()){
         ui->lineEdit_2->setText(QString().setNum(x/1024.0));
    }
  else  if(ui->radioButton_3->isChecked()){
         ui->lineEdit_2->setText(QString().setNum(x/1024.0/1024));
    }
    else  if(ui->radioButton_4->isChecked()){
           ui->lineEdit_2->setText(QString().setNum(x/1024.0/1024/1024));
      }
}

