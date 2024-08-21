#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "qmlinteractcpp.h"
#include "myqmlinteract.h"


int main(int argc, char *argv[])

{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    MyQmlInteract myQmlInteract;

    // qmlRegisterType<MyQmlInteract>("MyQmlInteract",1,0,"MyQmlInteract");
    engine.rootContext()->setContextProperty("myQmlInteract",&myQmlInteract);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();



    //另一个注册cpp到qml的方法，但是还没调通

    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //     QGuiApplication app(argc, argv);

    //     //qmlRegisterType注册C++类型至QML
    //     //arg1:import时模块名
    //     //arg2:主版本号
    //     //arg3:次版本号
    //     //arg4:QML类型名
    //     qmlRegisterType<CppObject>("MyCppObject",1,0,"CppObject");

    //     QQmlApplicationEngine engine;

    //     //也可以注册为qml全局对象
    //     //engine.rootContext()->setContextProperty("cppObj",new CppObject(qApp));

    //     engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //     if (engine.rootObjects().isEmpty())
    //         return -1;

    //     return app.exec();
}
