
#include <CSymbols.h>

extern void _open_swift_ui_anyViewFactory(void);

void *anyViewFactorySymbol() {
    return &_open_swift_ui_anyViewFactory;
}
