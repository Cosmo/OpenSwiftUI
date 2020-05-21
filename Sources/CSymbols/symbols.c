
#ifdef __linux__
#define _GNU_SOURCE
#endif

#include <CSymbols.h>
#include <stddef.h>
#include <dlfcn.h>

void *loadAddressForSymbol(const char *symbolName) {
    void *handle = dlopen(NULL, RTLD_GLOBAL);
    return dlsym(handle, symbolName);
}
