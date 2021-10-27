#pragma once
#ifdef amb_PLAT_WIN
#ifdef amb_BUILD_DLL
#define __amb __declspec(dllexport)
#else
#define __amb____declspec(dllimport)
#endif
#else
#error Ambro / amb only supports windows at the moment
#endif