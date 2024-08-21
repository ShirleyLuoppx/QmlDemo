#include "qmlinteractcpp.h"
#include <QDebug>

QmlInteractCpp::QmlInteractCpp(QObject *parent)
    : QObject(parent),
          myName("none"),
          myYear(0)
{

}

QmlInteractCpp::~QmlInteractCpp()
{

}

void QmlInteractCpp::sendSignal()
{
    //测试用，调用该函数后发送信号
    qDebug()<<"QmlInteractCpp::sendSignal";
    emit cppSignalA();
    emit cppSignalB(myName,myYear);
}

void QmlInteractCpp::setName(const QString &name)
{
    qDebug()<<"QmlInteractCpp::setName"<<name;
    if(myName!=name){
        qDebug()<<"emit nameChanged";
        myName=name;
        emit nameChanged(name);
    }
}

QString QmlInteractCpp::getName() const
{
    qDebug()<<"QmlInteractCpp::getName";
    return myName;
}

void QmlInteractCpp::setYear(int year)
{
    qDebug()<<"QmlInteractCpp::setYear"<<year;
    if(year!=myYear){
        qDebug()<<"emit yearChanged";
        myYear=year;
        emit yearChanged(myYear);
    }
}

int QmlInteractCpp::getYear() const
{
    qDebug()<<"QmlInteractCpp::getYear";
    return myYear;
}

void QmlInteractCpp::cppSlotA()
{
    qDebug()<<"QmlInteractCpp::cppSlotA";
}

void QmlInteractCpp::cppSlotB(const QString &str, int value)
{
    qDebug()<<"QmlInteractCpp::cppSlotB"<<str<<value;
}
