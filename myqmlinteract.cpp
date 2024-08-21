#include "myqmlinteract.h"
#include <QDebug>

MyQmlInteract::MyQmlInteract(QObject * parent)
    : QObject(parent)
{

}

MyQmlInteract::~MyQmlInteract()
{

}

void MyQmlInteract::slotClickBtnFromQml()
{
    qDebug()<<"click btn from qml";
}

void MyQmlInteract::onClickBtnFromQmlWithParams(int age, QString name)
{
    qDebug()<<"click btn from qml with params "<< age << name;
}
