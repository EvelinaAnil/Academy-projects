/********************************************************************************
** Form generated from reading UI file 'dialogaddcustumer.ui'
**
** Created by: Qt User Interface Compiler version 6.3.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGADDCUSTUMER_H
#define UI_DIALOGADDCUSTUMER_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>

QT_BEGIN_NAMESPACE

class Ui_DialogAddCustumer
{
public:

    void setupUi(QDialog *DialogAddCustumer)
    {
        if (DialogAddCustumer->objectName().isEmpty())
            DialogAddCustumer->setObjectName(QString::fromUtf8("DialogAddCustumer"));
        DialogAddCustumer->resize(400, 300);

        retranslateUi(DialogAddCustumer);

        QMetaObject::connectSlotsByName(DialogAddCustumer);
    } // setupUi

    void retranslateUi(QDialog *DialogAddCustumer)
    {
        DialogAddCustumer->setWindowTitle(QCoreApplication::translate("DialogAddCustumer", "Dialog", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DialogAddCustumer: public Ui_DialogAddCustumer {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGADDCUSTUMER_H
