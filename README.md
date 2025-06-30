# Markdown WASM Preview

This project creates a live markdown editor using WebAssembly and the CommonMark C library, rendered in the browser with a real-time HTML preview.

---

## Project Structure
```
/
├── index.html            # Web UI with editor and preview
├── cmark_wrapper.c       # C wrapper for exposing cmark to WASM
├── build.sh              # Build script using emscripten
├── cmark/                # Cloned CommonMark repo
├── cmark.js              # WebAssembly JS glue code (generated)
├── cmark.wasm            # Compiled WASM binary (generated)
```

---

## Features
- Markdown input with **CodeMirror editor**
- **Live HTML preview** rendered from markdown
- Markdown compiled from **C to WebAssembly** using `emcc`
- Uses the official **CommonMark** spec (no GitHub-flavored Markdown (GFM) extensions)

---

## Getting Started

### 1. Prerequisites
- [Emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html) installed and activated:
  ```bash
  cd ~/emsdk
  ./emsdk install latest
  ./emsdk activate latest
  source ./emsdk_env.sh
  ```
- CMake:
  ```bash
  sudo apt install cmake
  ```

---

### 2. Build Instructions
```bash
chmod +x build.sh
./build.sh
```
This will:
- Clone the `cmark` repo if missing
- Build it using CMake
- Compile it to WebAssembly with your wrapper

---

### 3. Run the App
```bash
python3 -m http.server 8000
```
Visit: [http://localhost:8000](http://localhost:8000)

You’ll see:
- Markdown editor (left)
- Live preview (right)

---



