#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlDatabase>
#include "dialogaddcustumer.h"
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();

private:
    DialogAddCustumer*  formCust;
    Ui::MainWindow *ui;
    QSqlDatabase db;
    void OrderByLastMonth();
    void vipClients();
};
#endif // MAINWINDOW_H