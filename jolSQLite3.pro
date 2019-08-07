# Original Source Code
# https://www.sqlite.org/
# https://www.sqlite.org/download.html
# jlarapr

TEMPLATE = lib
CONFIG += dll
CONFIG -= app_bundle
CONFIG -= qt

VERSION=3.29.0.0
QMAKE_TARGET_COMPANY = SQLite3
QMAKE_TARGET_PRODUCT =SQLite3
QMAKE_TARGET_DESCRIPTION = SQLite3
QMAKE_TARGET_COPYRIGHT = SQLite3
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

SOURCES += \
        src/shell.c \
        src/sqlite3.c

HEADERS += \
    src/sqlite3.h \
    src/sqlite3ext.h


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


isEmpty(TARGET_EXT) {
    win32 {
        #TARGET_CUSTOM_EXT = .exe
    }
    macx {
        TARGET_CUSTOM_EXT = .app
    }
} else {
    TARGET_CUSTOM_EXT = $${TARGET_EXT}
}


CONFIG(release, debug|release):{
     # release
     release: DESTDIR = "release"
     #DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/.executable/$${TARGET}$${TARGET_CUSTOM_EXT}))
     DEPLOY_TARGET = $$shell_quote($$shell_path(/.executable/$${TARGET}$${TARGET_CUSTOM_EXT}))
    MyMakefile = Makefile.Release
 }else:CONFIG(debug, debug|release):{
     # debug
     debug: DESTDIR = "debug"
     #DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/.executable/$${TARGET}$${TARGET_CUSTOM_EXT}))
     DEPLOY_TARGET = $$shell_quote($$shell_path(/.executable/$${TARGET}$${TARGET_CUSTOM_EXT}))
     #DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/$${TARGET}$${TARGET_CUSTOM_EXT}))
     MyMakefile = Makefile.Debug
 }

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui
QMAKE_MAKEFILE = $$DESTDIR/Makefile
MAKEFILE = $$DESTDIR/$$MyMakefile
TARGET = $$DEPLOY_TARGET

DISTFILES += \
    README.md
