#!/bin/bash
# Vi-SakiWin64 build script
# Run in MSYS2 UCRT64 shell
set -e

BUSYBOX_COMMIT="686a0803f9747206eef5337100c5338431891e45"
BUSYBOX_DIR="busybox-w32"

echo "=== Vi-SakiWin64 Build ==="

# 1. Init submodule and checkout pinned commit
echo "[1/5] Initializing busybox-w32 submodule @ ${BUSYBOX_COMMIT:0:12}..."
git submodule update --init --recursive
cd "$BUSYBOX_DIR"
git checkout "$BUSYBOX_COMMIT"
cd ..

# 2. Apply patches
echo "[2/5] Applying SakiVI patches..."
cp patches/vi.c "$BUSYBOX_DIR/editors/vi.c"
cp patches/ash.c "$BUSYBOX_DIR/ash.c"

# 3. Generate .config with vi-only whitelist
echo "[3/5] Generating vi-only .config..."
cat > "$BUSYBOX_DIR/vi_whitelist.config" <<EOF
# --- Platform (Windows required) ---
CONFIG_PLATFORM_MINGW32=y
CONFIG_DESKTOP=y
CONFIG_LFS=y
CONFIG_SHOW_USAGE=y
CONFIG_LONG_OPTS=y
CONFIG_WERROR=n

# --- Unicode (CJK required) ---
CONFIG_UNICODE_SUPPORT=y
CONFIG_UNICODE_USING_LOCALE=y
CONFIG_LAST_SUPPORTED_WCHAR=0
CONFIG_SUBST_WCHAR=63
CONFIG_UNICODE_COMBINING_WCHARS=y
CONFIG_UNICODE_WIDE_WCHARS=y
CONFIG_UNICODE_BIDI_SUPPORT=y
CONFIG_UNICODE_NEUTRAL_TABLE=y

# --- Vi editor ---
CONFIG_VI=y
CONFIG_FEATURE_VI_MAX_LEN=4096
CONFIG_FEATURE_VI_8BIT=y
CONFIG_FEATURE_VI_COLON=y
CONFIG_FEATURE_VI_COLON_EXPAND=y
CONFIG_FEATURE_VI_YANKMARK=y
CONFIG_FEATURE_VI_SEARCH=y
CONFIG_FEATURE_VI_REGEX_SEARCH=y
CONFIG_FEATURE_VI_USE_SIGNALS=y
CONFIG_FEATURE_VI_DOT_CMD=y
CONFIG_FEATURE_VI_READONLY=y
CONFIG_FEATURE_VI_SETOPTS=y
CONFIG_FEATURE_VI_SET=y
CONFIG_FEATURE_VI_WIN_RESIZE=y
CONFIG_FEATURE_VI_ASK_TERMINAL=y
CONFIG_FEATURE_VI_UNDO=y
CONFIG_FEATURE_VI_UNDO_QUEUE=y
CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
CONFIG_FEATURE_VI_VERBOSE_STATUS=y
CONFIG_FEATURE_VI_FILE_FORMAT=y
EOF

cd "$BUSYBOX_DIR"
make allnoconfig KCONFIG_ALLCONFIG=vi_whitelist.config

# 4. Build
echo "[4/5] Building (parallel)..."
make -j$(nproc)

# 5. Output
cd ..
cp "$BUSYBOX_DIR/busybox.exe" "vi.exe"
echo "[5/5] Done! Output: vi.exe"
echo ""
echo "Usage:  ./vi.exe [file]"
