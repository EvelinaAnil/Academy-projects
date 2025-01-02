#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "QGraphicsView"
#include "QGraphicsScene"
#include "QGraphicsPixmapItem"
#include "QVector"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
    QGraphicsScene *scene;

    QVector<QGraphicsPixmapItem*> whiteFigures;
    QVector<QGraphicsPixmapItem*> blackFigures;

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    
private:
    Ui::MainWindow *ui;

private:
    void generateBoard();
};

#endif // MAINWINDOW_H
