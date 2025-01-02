#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

   correct=0;


}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    int n1 = ui->number1->text().toInt();
    int n2 = ui->number2->text().toInt();

    int user = ui->lineEdit->text().toInt();

    if(user == n1*n2){
        correct++;
        QMessageBox::about(this, "Answer", "Good! Score: " + QString ().setNum(correct));
randMath();
ui->lineEdit->clear();
    }
    else{
        QMessageBox::about(this, "Answer", "Bad!");
    }
}

void MainWindow::randMath()
{
    int x1 = 2, x2 = 9;
    int n1 = rand()%(x2-x1+1) + x1;
    int n2 = rand()%(x2-x1+1) + x1;

    ui->number1->setNum(n1);
    ui->number2->setNum(n2);
}

