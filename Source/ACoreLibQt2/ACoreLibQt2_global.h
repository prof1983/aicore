#ifndef ACORELIBQT2_GLOBAL_H
#define ACORELIBQT2_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(ACORELIBQT2_LIBRARY)
#  define ACORELIBQT2SHARED_EXPORT Q_DECL_EXPORT
#else
#  define ACORELIBQT2SHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // ACORELIBQT2_GLOBAL_H