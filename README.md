# Vi-SakiWin64

**Vi — 就是那個 Vi，不是什麼 Vim。**

**Author**: 咲ちゃん（Saki）/ Saki Studio — [saki-studio.com.tw](http://saki-studio.com.tw)
**Co-author**: Claude Opus 4.6
**License**: GPL-2.0-only

> Bill Joy 的 vi，在 Windows 上重新編譯。178KB，打完收工。

> Bill Joyのvi、Windowsで再コンパイル。178KB、それだけ。

> Bill Joy's vi, recompiled for Windows. 178KB. That's it.

---

## 淵源 / 由来 / Origin

**繁體中文**

vobject 做過 Vi-win32，但帳號和原始碼一起消失了。[Traditional Vi](https://ex-vi.sourceforge.net) 是能找到的最後遺跡，感謝袁志豪 / lichray 維護到最後。Nvi 依賴太重，不適合單檔移植。最終取源自 [busybox-w32](https://github.com/rmyorston/busybox-w32)——Ron Yorston 持續維護的 BusyBox Windows 分支。

基於 commit `686a0803f9`（`ash: fix execution of applets via Unix-style path`），以 MSYS2 UCRT64 編譯為原生 Win64。依照 GPLv2 條款釋出。

**日本語**

vobject氏がVi-win32を作りましたが、アカウントごとソースコードも消えました。[Traditional Vi](https://ex-vi.sourceforge.net) が見つかる最後の痕跡で、袁志豪 / lichray氏が最後まで保守してくれました。Nviは依存が重く、単一ファイルへの移植には不向き。最終的に [busybox-w32](https://github.com/rmyorston/busybox-w32)（Ron Yorston氏が継続メンテ中のBusyBox Windowsフォーク）をソースとしました。

コミット `686a0803f9`（`ash: fix execution of applets via Unix-style path`）をベースに、MSYS2 UCRT64でネイティブWin64としてビルド。GPLv2条項に従い公開。

**English**

vobject built Vi-win32, but the account and source code vanished together. [Traditional Vi](https://ex-vi.sourceforge.net) is the last surviving trace; credit to 袁志豪 / lichray for maintaining it. Nvi's dependency chain made it impractical for single-binary porting. The source was ultimately taken from [busybox-w32](https://github.com/rmyorston/busybox-w32) — Ron Yorston's actively maintained BusyBox fork for Windows.

Based on commit `686a0803f9` (`ash: fix execution of applets via Unix-style path`), compiled as native Win64 with MSYS2 UCRT64. Released under GPLv2.

---

## 功能 / 機能 / Features

| | 繁中 | 日本語 | English |
|---|---|---|---|
| 🌏 | 三語介面 | 三言語インターフェース | Trilingual UI |
| 📦 | 單檔免安裝 | 単一実行ファイル | Single portable binary |
| 🪟 | 原生 Win64 + Unicode | ネイティブ Win64 + Unicode | Native Win64 + Unicode |
| ⚡ | 基於 BusyBox vi | BusyBox vi ベース | BusyBox vi based |
| 📖 | `:help` 三語快速參考 | `:help` 三言語リファレンス | `:help` trilingual reference |
| 🔧 | `WriteConsoleW` 自適應 | コードページ自動対応 | Codepage-aware output |

## 安裝 / インストール / Install

[![Winget](https://img.shields.io/badge/winget-SakiStudio.SakiVI-blue?logo=windows)](https://github.com/microsoft/winget-pkgs/tree/master/manifests/s/SakiStudio/SakiVI)

### Winget — Official Installation（推薦 / 推奨 / Recommended）

```powershell
winget install SakiStudio.SakiVI
vi file.txt
```

> Approved by [Microsoft Winget](https://github.com/microsoft/winget-pkgs/pull/339486) on first submission.
> Rejected by [Scoop maintainers](https://github.com/ScoopInstaller/Main/pull/7643) because "Vi is not famous enough."

<details>
<summary>Scoop maintainer's exact words / 原文</summary>

> I suggest maintaining this in your [personal bucket](https://github.com/ScoopInstaller/Scoop/wiki/Buckets#creating-your-own-bucket) instead. Please feel free to reopen this PR once it fully meets the criteria.
>
> — [z-Fng](https://github.com/z-Fng), ScoopInstaller/Main [#7643](https://github.com/ScoopInstaller/Main/pull/7643)

All automated checks passed: Lint ✅ Description ✅ License ✅ Hashes ✅ Checkver ✅ Autoupdate ✅

</details>

### Scoop — Personal Bucket

Since Scoop Main/Extras refuses to host this, you can add our personal bucket:

```powershell
scoop bucket add sakivi https://github.com/Saki-tw/scoop-sakivi
scoop install saki-vi
vi file.txt   # 直接可用 / すぐ使える / ready to go
```

### 手動 / 手動 / Manual
[下載 vi.exe](https://saki-studio.com.tw/downloads/vi.exe) → 放入 PATH → 完事

### PowerShell One-liner
```powershell
irm https://saki-studio.com.tw/downloads/install.ps1 | iex
```

### 使用 / 使い方 / Usage
```
vi file.txt       # 編輯 / 編集 / edit
vi -H             # 功能一覽 / 機能一覧 / features
vi --version      # 版本資訊 / バージョン / version
:help             # 快速參考 / リファレンス / quick ref
:features         # 編譯功能 / ビルド機能 / compiled features
```

## 建置 / ビルド / Build

**繁中** — 使用 **MSYS2 UCRT64** 工具鏈。UCRT64 環境基於 Universal C Runtime，
是 Windows 10+ 的原生 C 執行時期。產生的二進位不依賴 `msys-2.0.dll`，
單檔可攜——就像一首可以離線朗讀的詩。

**日本語** — **MSYS2 UCRT64** ツールチェーンでビルドします。UCRT64 環境は
Universal C Runtime に基づいており、Windows 10+ のネイティブ C ランタイムです。
生成されるバイナリは `msys-2.0.dll` に依存しません。単一ファイルで持ち運べます。

**English** — Built with the **MSYS2 UCRT64** toolchain. UCRT64 targets the
Universal C Runtime, native to Windows 10+. The resulting binary carries no
`msys-2.0.dll` dependency — a single portable executable, self-contained.

### 前置需求 / 前提条件 / Prerequisites
```bash
# MSYS2 をインストール後、UCRT64 shell で / After installing MSYS2, in UCRT64 shell:
pacman -S mingw-w64-ucrt-x86_64-gcc make git
```

### 編譯 / コンパイル / Compile
```bash
git clone --recursive https://github.com/Saki-tw/VI-SakiWin64.git
cd Vi-SakiWin64
bash scripts/build.sh
# → vi.exe（原生 Win64 / ネイティブ Win64 / native Win64, no msys-2.0.dll）
```

### 工具鏈 / ツールチェーン / Toolchain
| | |
|---|---|
| **Compiler** | `mingw-w64-ucrt-x86_64-gcc` |
| **C Runtime** | UCRT（非 MSVCRT / not Cygwin） |
| **Linking** | 靜態 / 静的 / static, single binary |
| **Source** | busybox-w32 @ `686a0803f9` (pinned) |

## 授權 / ライセンス / License

**GPL-2.0-only**

本專案是 [BusyBox](https://busybox.net/) 及 [busybox-w32](https://github.com/rmyorston/busybox-w32) 的衍生作品。
完整授權條款見 [LICENSE](LICENSE)，上游歸屬見 [NOTICE](NOTICE)，第三方授權見 [THIRD_PARTY_LICENSES](THIRD_PARTY_LICENSES)。

---

## Acknowledgments

- [BusyBox](https://busybox.net/) and [busybox-w32](https://github.com/rmyorston/busybox-w32) by Ron Yorston
- [microsoft/winget-pkgs](https://github.com/microsoft/winget-pkgs) for the validation pipeline and manifest feedback
- Bill Joy, for writing vi in the first place