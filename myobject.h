#ifndef MYOBJECT_H
#define MYOBJECT_H
#include <QObject>
#include <QtDebug>

class MyObject : public QObject
{
    Q_OBJECT

public:
    explicit MyObject(QObject *parent = nullptr) : QObject(parent) {}

signals:
    void mySignal(QString message);

public slots:
    void mySlot(const QString& message) { qDebug() << "Received message from QML:" << message; emit mySignal("Hello from C++");}
};
#endif // MYOBJECT_H
