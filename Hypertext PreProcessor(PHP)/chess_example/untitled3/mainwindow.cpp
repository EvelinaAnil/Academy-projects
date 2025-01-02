#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    generateBoard();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::generateBoard()
{
    scene = new QGraphicsScene();
    scene->setSceneRect(0, 0, 800, 800);
    ui->gView->setScene(scene);

    bool isWhite = true;
    for(int y = 0; y < 800; y += 100)
    {
        for(int x = 0; x < 800; x += 100)
        {
            QBrush brush;
            if(isWhite) brush = QBrush(Qt::white);
            else brush = QBrush(Qt::gray);
            scene->addRect(x, y, 100, 100, QPen(Qt::black), brush);

            if(isWhite) isWhite = false;
            else isWhite = true;
        }
        if(isWhite) isWhite = false;
        else isWhite = true;
    }

    int posX = 0;
    int posY = 0;

    QGraphicsPixmapItem *figure = 0;
    figure = scene->addPixmap(QPixmap("://Resourses/black_rook.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_horse.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_bishop.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_queen.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_king.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_bishop.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_horse.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/black_rook.png"));
    figure->setPos(posX, posY);
    if(figure) blackFigures.append(figure);

    posX = 0;
    posY = 700;

    figure = scene->addPixmap(QPixmap("://Resourses/white_rook.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_horse.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_bishop.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_queen.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_king.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_bishop.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_horse.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posX += 100;
    figure = scene->addPixmap(QPixmap("://Resourses/white_rook.png"));
    figure->setPos(posX, posY);
    if(figure) whiteFigures.append(figure);

    posY = 100;
    for(posX = 0; posX < 800; posX += 100)
    {
        figure = scene->addPixmap(QPixmap("://Resourses/black_pawn.png"));
        figure->setPos(posX, posY);
        if(figure) blackFigures.append(figure);
    }

    posY = 600;
    for(posX = 0; posX < 800; posX += 100)
    {
        figure = scene->addPixmap(QPixmap("://Resourses/white_pawn.png"));
        figure->setPos(posX, posY);
        if(figure) whiteFigures.append(figure);
    }
}
