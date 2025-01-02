#ifndef DIALOGADDCUSTUMER_H
#define DIALOGADDCUSTUMER_H

#include <QDialog>

namespace Ui {
class DialogAddCustumer;
}

class DialogAddCustumer : public QDialog
{
    Q_OBJECT

public:
    explicit DialogAddCustumer(QWidget *parent = nullptr);
    ~DialogAddCustumer();

private:
    Ui::DialogAddCustumer *ui;
};

#endif // DIALOGADDCUSTUMER_H
