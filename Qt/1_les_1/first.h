#ifndef FIRST_H
#define FIRST_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class First; }
QT_END_NAMESPACE
using namespace Ui;

class First : public QMainWindow
{
    Q_OBJECT

public:
    First(QWidget *parent = nullptr);
    ~First();

private:
    Ui::First *ui;
};
#endif // FIRST_H
