
# Step 1: Clone cmark if not already cloned
if [ ! -d "cmark" ]; then
  git clone https://github.com/commonmark/cmark.git
fi

# Step 2: Build with CMake to generate headers like export, version
mkdir -p cmark/build
cd cmark/build
emcmake cmake ..
cmake --build . --target cmark_static
cd ../../

# Step 3: Compile with emcc
emcc \
  cmark/build/src/libcmark.a \
  cmark_wrapper.c \
  -I./cmark/src -I./cmark/build/src \
  -sEXPORTED_FUNCTIONS='["_wasm_markdown_to_html", "_malloc", "_free"]' \
  -sEXPORTED_RUNTIME_METHODS='["ccall", "cwrap", "UTF8ToString", "stringToUTF8", "lengthBytesUTF8"]' \
  -sENVIRONMENT=web \
  -sMODULARIZE \
  -sEXPORT_NAME="createCmarkModule" \
  -o cmark.js
