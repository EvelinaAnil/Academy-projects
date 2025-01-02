/********************************************************************************
** Form generated from reading UI file 'first.ui'
**
** Created by: Qt User Interface Compiler version 6.3.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_FIRST_H
#define UI_FIRST_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_numbe1
{
public:
    QWidget *centralwidget;
    QHBoxLayout *horizontalLayout;
    QLabel *number1;
    QLabel *label_2;
    QLabel *number2;
    QLabel *label_4;
    QLineEdit *lineEdit;
    QPushButton *pushButton;
    QMenuBar *menubar;
    QMenu *menuFFFFFF;
    QMenu *menuQWWQ;
    QMenu *menuQwQ;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *numbe1)
    {
        if (numbe1->objectName().isEmpty())
            numbe1->setObjectName(QString::fromUtf8("numbe1"));
        numbe1->resize(566, 302);
        numbe1->setStyleSheet(QString::fromUtf8("\n"
"background-color: rgb(175, 175, 175);\n"
"color: rgb(0, 0, 0);"));
        centralwidget = new QWidget(numbe1);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        horizontalLayout = new QHBoxLayout(centralwidget);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        number1 = new QLabel(centralwidget);
        number1->setObjectName(QString::fromUtf8("number1"));
        number1->setMaximumSize(QSize(7, 296));
        number1->setStyleSheet(QString::fromUtf8("font: 9pt \"Segoe UI Emoji\";"));

        horizontalLayout->addWidget(number1);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setMaximumSize(QSize(6, 313));
        label_2->setStyleSheet(QString::fromUtf8("font: 9pt \"Segoe UI Emoji\";"));

        horizontalLayout->addWidget(label_2);

        number2 = new QLabel(centralwidget);
        number2->setObjectName(QString::fromUtf8("number2"));
        number2->setMaximumSize(QSize(7, 313));
        number2->setStyleSheet(QString::fromUtf8("font: 10pt \"Segoe UI Emoji\";\n"
""));

        horizontalLayout->addWidget(number2);

        label_4 = new QLabel(centralwidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setMaximumSize(QSize(8, 296));

        horizontalLayout->addWidget(label_4);

        lineEdit = new QLineEdit(centralwidget);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));
        lineEdit->setStyleSheet(QString::fromUtf8("background-color: rgb(255, 255, 255);"));

        horizontalLayout->addWidget(lineEdit);

        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));

        horizontalLayout->addWidget(pushButton);

        numbe1->setCentralWidget(centralwidget);
        menubar = new QMenuBar(numbe1);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 566, 21));
        menuFFFFFF = new QMenu(menubar);
        menuFFFFFF->setObjectName(QString::fromUtf8("menuFFFFFF"));
        menuQWWQ = new QMenu(menubar);
        menuQWWQ->setObjectName(QString::fromUtf8("menuQWWQ"));
        menuQwQ = new QMenu(menubar);
        menuQwQ->setObjectName(QString::fromUtf8("menuQwQ"));
        numbe1->setMenuBar(menubar);
        statusbar = new QStatusBar(numbe1);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        numbe1->setStatusBar(statusbar);

        menubar->addAction(menuFFFFFF->menuAction());
        menubar->addAction(menuQWWQ->menuAction());
        menubar->addAction(menuQwQ->menuAction());

        retranslateUi(numbe1);

        QMetaObject::connectSlotsByName(numbe1);
    } // setupUi

    void retranslateUi(QMainWindow *numbe1)
    {
        numbe1->setWindowTitle(QCoreApplication::translate("numbe1", "First", nullptr));
        number1->setText(QCoreApplication::translate("numbe1", "0", nullptr));
        label_2->setText(QCoreApplication::translate("numbe1", "x", nullptr));
        number2->setText(QCoreApplication::translate("numbe1", "0", nullptr));
        label_4->setText(QCoreApplication::translate("numbe1", "=", nullptr));
        pushButton->setText(QCoreApplication::translate("numbe1", "Ok", nullptr));
        menuFFFFFF->setTitle(QCoreApplication::translate("numbe1", "FFFFFF", nullptr));
        menuQWWQ->setTitle(QCoreApplication::translate("numbe1", "QWWQ", nullptr));
        menuQwQ->setTitle(QCoreApplication::translate("numbe1", "QwQ", nullptr));
    } // retranslateUi

};

namespace Ui {
class numbe1: puprivate slots:
        void on_pushButton_clicked();
blic Ui_numbe1 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_FIRST_H
