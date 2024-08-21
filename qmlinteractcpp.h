#ifndef QMLINTERACTCPP_H
#define QMLINTERACTCPP_H
#include <QObject>

//Qml和Cpp 交互

class QmlInteractCpp : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(int year READ getYear WRITE setYear NOTIFY yearChanged FINAL)

public:
    explicit QmlInteractCpp(QObject *parent = nullptr);
    virtual ~QmlInteractCpp();

    Q_INVOKABLE void sendSignal();

    //给类属性添加访问方法--myName
    void setName(const QString &name);
    QString getName() const;
    //给类属性添加访问方法--myYear
    void setYear(int year);
    int getYear() const;


signals:
    //信号可以在QML中访问
    void cppSignalA();//一个无参信号
    void cppSignalB(const QString &str,int value);//一个带参数信号
    void nameChanged(const QString name);
    void yearChanged(int year);

public slots:
    //public槽函数可以在QML中访问
    void cppSlotA();//一个无参槽函数
    void cppSlotB(const QString &str,int value);//一个带参数槽函数

private:
    //类的属性
    QString myName;
    int myYear;
};

#endif // QMLINTERACTCPP_H
