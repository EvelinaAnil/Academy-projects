/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.3.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionvlbui;
    QWidget *centralwidget;
    QLabel *number1;
    QLabel *label_2;
    QLabel *number2;
    QLabel *label_4;
    QLineEdit *lineEdit;
    QPushButton *pushButton;
    QMenuBar *menubar;
    QMenu *menusdfd;
    QMenu *menugyj;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(456, 118);
        MainWindow->setStyleSheet(QString::fromUtf8(""));
        actionvlbui = new QAction(MainWindow);
        actionvlbui->setObjectName(QString::fromUtf8("actionvlbui"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        number1 = new QLabel(centralwidget);
        number1->setObjectName(QString::fromUtf8("number1"));
        number1->setGeometry(QRect(9, 9, 16, 36));
        number1->setStyleSheet(QString::fromUtf8("font: 700 20pt \"Segoe UI\";"));
        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(31, 9, 16, 36));
        label_2->setStyleSheet(QString::fromUtf8("font: 700 20pt \"Segoe UI\";"));
        number2 = new QLabel(centralwidget);
        number2->setObjectName(QString::fromUtf8("number2"));
        number2->setGeometry(QRect(50, 10, 21, 36));
        number2->setStyleSheet(QString::fromUtf8("font: 700 20pt \"Segoe UI\";"));
        label_4 = new QLabel(centralwidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setGeometry(QRect(80, 10, 19, 36));
        label_4->setStyleSheet(QString::fromUtf8("font: 700 20pt \"Segoe UI\";"));
        lineEdit = new QLineEdit(centralwidget);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));
        lineEdit->setGeometry(QRect(110, 20, 184, 32));
        lineEdit->setStyleSheet(QString::fromUtf8("font: 14pt \"Segoe UI\";"));
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));
        pushButton->setGeometry(QRect(310, 20, 75, 24));
        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 456, 22));
        menusdfd = new QMenu(menubar);
        menusdfd->setObjectName(QString::fromUtf8("menusdfd"));
        menugyj = new QMenu(menubar);
        menugyj->setObjectName(QString::fromUtf8("menugyj"));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        menubar->addAction(menusdfd->menuAction());
        menubar->addAction(menugyj->menuAction());
        menugyj->addAction(actionvlbui);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        actionvlbui->setText(QCoreApplication::translate("MainWindow", "vlbui", nullptr));
        number1->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        label_2->setText(QCoreApplication::translate("MainWindow", "x", nullptr));
        number2->setText(QCoreApplication::translate("MainWindow", "0", nullptr));
        label_4->setText(QCoreApplication::translate("MainWindow", "=", nullptr));
        pushButton->setText(QCoreApplication::translate("MainWindow", "Ok", nullptr));
        menusdfd->setTitle(QCoreApplication::translate("MainWindow", "sdfd", nullptr));
        menugyj->setTitle(QCoreApplication::translate("MainWindow", "gyj", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
