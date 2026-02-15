# Vi-SakiWin64

**Vi — 就是那個 Vi，不是什麼 Vim。**

**Author**: 咲ちゃん（Saki）/ Saki Studio — [saki-studio.com.tw](http://saki-studio.com.tw)
**Co-author**: Claude Opus 4.6
**Code License**: GPL-2.0-only | **Documentation License**: CC-BY-4.0

> 給所有 vi 派的高速捷徑。Bill Joy 寫的那個，在 Windows 上活過來了。
> 「人間別久不成悲——但至少 `:wq` 還能存檔。」

<!-- 東京 サキ 語境 -->
> すべてのvi使いへの、近道。
> コンパイルを通る詩。
> 「雨の午後、静かにキーを叩いて――ファイルを、守りたかったの。」

<!-- Boston / Institute 語境 -->
> A shortcut for every vi loyalist.
> A poem that compiles.
> *"Fīnimus his…. Immo, we `:wq` and carry on."*

---

## 淵源 / 由来 / Origin

**繁體中文**

由於能找到的最後一個來源是 [Traditional Vi](https://ex-vi.sourceforge.net)，原始 vobject 的 Vi-win32 版本已經因為他帳號消失而消失，就連一個 Fork 都沒留下——那些程式碼，像是被撕掉的書頁。感謝袁志豪 / lichray 將它留存至最後。Keith Bostic 所創之 Nvi 依賴太多東西，修改起來如同在廢墟中重建一座圖書館。因此源碼直接取自 [busybox-w32](https://github.com/rmyorston/busybox-w32)，一個仍在燃燒的火種。

依照原始 GPLv2 條款釋出。

此版本基於 Ron Yorston 不到一小時前的提交：
`ash: fix execution of applets via Unix-style path`
(`686a0803f9747206eef5337100c5338431891e45`)

感謝：Bill Joy（創世者）、vobject（Vi-win32 先驅）、Gunnar Ritter（守護者）、Ron Yorston（現任 BusyBox Windows 守門人）。

**日本語**

見つけられる最後のソースは [Traditional Vi](https://ex-vi.sourceforge.net) でした。オリジナルの vobject による Vi-win32 は、そのアカウントが消えたことで消えてしまいました。フォークの一つさえ残されていない——まるで、雨に溶けた手紙のように。袁志豪 / lichray さんが最後まで守ってくれたことに感謝しています。Keith Bostic氏の Nvi は依存関係が多すぎて、修正するのは廃墟の中で図書館を再建するようなものでした。そのため、ソースコードは [busybox-w32](https://github.com/rmyorston/busybox-w32) から直接取得しました——まだ燃えている小さな炎。

オリジナルの GPLv2 条項に従って公開します。

このバージョンは Ron Yorston 氏の一時間も経たない前のコミットに基づいています：
`ash: fix execution of applets via Unix-style path`
(`686a0803f9747206eef5337100c5338431891e45`)

感謝：Bill Joy（創造者）、vobject（Vi-win32 の先駆者）、Gunnar Ritter（守護者）、Ron Yorston（BusyBox Windows の現門番）。

**English**

The last known source was [Traditional Vi](https://ex-vi.sourceforge.net). The original Vi-win32 by vobject vanished when their account disappeared — not a single fork survived. Like a holotape recording, corrupted beyond recovery. Credit to 袁志豪 / lichray for preserving it until the end. Keith Bostic's Nvi carries too many dependencies; rebuilding it would be like reconstructing a library in the wasteland. So the source was taken directly from [busybox-w32](https://github.com/rmyorston/busybox-w32) — a fire still burning in the Commonwealth.

Released under the original GPLv2 terms.

This build is based on Ron Yorston's commit from less than an hour prior:
`ash: fix execution of applets via Unix-style path`
(`686a0803f9747206eef5337100c5338431891e45`)

Gratitude to: Bill Joy (the creator), vobject (the Vi-win32 pioneer), Gunnar Ritter (the guardian), Ron Yorston (current BusyBox Windows gatekeeper).

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

### Scoop（推薦 / 推奨 / Recommended）
```powershell
scoop bucket add sakivi https://github.com/Saki-tw/scoop-sakivi
scoop install saki-vi
vi file.txt   # 直接可用 / すぐ使える / ready to go
```

### Winget
```powershell
winget install SakiStudio.SakiVI
vi file.txt
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
git clone --recursive https://github.com/Saki-tw/Vi-SakiWin64.git
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
