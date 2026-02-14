# Changelog

## [1.0.0] — 2026-02-15

首次公開發行。

找了很久 Windows 上能用的原版 vi——不是 Vim、不是 NeoVim、不是任何「vi 改良版」。就是 Bill Joy 在 1976 年寫的那個。找到的東西：一個帳號消失的 Vi-win32 作者、一個還亮著燈的 [sourceforge 頁面](https://ex-vi.sourceforge.net)、一個假設你有 `/usr/lib` 的 Nvi。

最終從 [busybox-w32](https://github.com/rmyorston/busybox-w32) 切出 vi，用 MSYS2 UCRT64 編成原生 Win64。

### 這個版本有什麼

- vi 編輯器（就是 vi，沒有別的）
- 178KB 單檔，不需要 `msys-2.0.dll`
- `WriteConsoleW` 直接 Unicode 輸出（`chcp 65001` 也不用設了，反正那治標不治本）
- 三語 `:help`（繁中 / 日本語 / EN）
- `:features` 顯示編譯功能
- `-H` 功能摘要
- CJK 全寬字元、組合字元、雙向文字支援
- Undo queue 256 層、regex search、dot command、read-only mode

### 修了什麼

- `ash.c` 信號處理在 Windows 編譯會爆，補了 patch
- `vi.c` 加了三語 help 和 `WriteConsoleW` codepage 處理

### 數字

| | |
|---|---|
| 最終二進位 | 178KB |
| `vi_whitelist.config` | 30 行 |
| 基底 commit | `686a0803f9` |
| 工具鏈 | mingw-w64-ucrt-x86_64-gcc |
