#ifndef MYQMLINTERACT_H
#define MYQMLINTERACT_H
#include <QObject>


class MyQmlInteract :  public QObject
{
    Q_OBJECT
public:
    explicit MyQmlInteract(QObject *parent = nullptr);
    ~MyQmlInteract() ;

public:
    // Q_INVOKABLE aa();

public slots:
    void slotClickBtnFromQml();
    void onClickBtnFromQmlWithParams(int age,QString name);

};

#endif // MYQMLINTERACT_H
