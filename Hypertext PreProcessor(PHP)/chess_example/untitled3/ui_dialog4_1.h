/********************************************************************************
** Form generated from reading UI file 'dialog4_1.ui'
**
** Created: Fri 25. Apr 09:29:50 2014
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOG4_1_H
#define UI_DIALOG4_1_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Dialog4_1
{
public:
    QDialogButtonBox *buttonBox;
    QPushButton *pushButton_4_99;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QLineEdit *lineEdit_4;

    void setupUi(QDialog *Dialog4_1)
    {
        if (Dialog4_1->objectName().isEmpty())
            Dialog4_1->setObjectName(QString::fromUtf8("Dialog4_1"));
        Dialog4_1->resize(400, 300);
        buttonBox = new QDialogButtonBox(Dialog4_1);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(30, 240, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        pushButton_4_99 = new QPushButton(Dialog4_1);
        pushButton_4_99->setObjectName(QString::fromUtf8("pushButton_4_99"));
        pushButton_4_99->setGeometry(QRect(120, 40, 75, 23));
        horizontalLayoutWidget = new QWidget(Dialog4_1);
        horizontalLayoutWidget->setObjectName(QString::fromUtf8("horizontalLayoutWidget"));
        horizontalLayoutWidget->setGeometry(QRect(10, 90, 381, 80));
        horizontalLayout = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        lineEdit_4 = new QLineEdit(Dialog4_1);
        lineEdit_4->setObjectName(QString::fromUtf8("lineEdit_4"));
        lineEdit_4->setGeometry(QRect(10, 190, 113, 20));

        retranslateUi(Dialog4_1);
        QObject::connect(buttonBox, SIGNAL(accepted()), Dialog4_1, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Dialog4_1, SLOT(reject()));

        QMetaObject::connectSlotsByName(Dialog4_1);
    } // setupUi

    void retranslateUi(QDialog *Dialog4_1)
    {
        Dialog4_1->setWindowTitle(QApplication::translate("Dialog4_1", "Dialog", 0, QApplication::UnicodeUTF8));
        pushButton_4_99->setText(QApplication::translate("Dialog4_1", "PushButton", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Dialog4_1: public Ui_Dialog4_1 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOG4_1_H
