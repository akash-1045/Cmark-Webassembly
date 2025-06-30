#include "cmark.h"
#include <stdlib.h>

char* wasm_markdown_to_html(const char* text, size_t len, int options) {
    return cmark_markdown_to_html(text, len, options);
}