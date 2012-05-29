#-------------------------------------------------
#
# Project created by QtCreator 2012-05-28T10:39:34
#
#-------------------------------------------------

QT       -= core gui

TARGET = ACoreLibQt2
TEMPLATE = lib

DEFINES += ACORELIBQT2_LIBRARY

SOURCES += ACoreLib.cpp

HEADERS += ACoreLib.h\
        ACoreLibQt2_global.h

symbian {
    MMP_RULES += EXPORTUNFROZEN
    TARGET.UID3 = 0xE3603229
    TARGET.CAPABILITY = 
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = ACoreLibQt2.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
}

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
