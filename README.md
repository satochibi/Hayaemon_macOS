聞々ハヤえもん for macOS
=======================

## このリポジトリについて
本リポジトリは、山内良太氏による聞々ハヤえもん macOS移植版をもとに、satochibiが開発を継続しているものです。元のリポジトリから、以下のような変更を加えています。
- Apple Silicon (arm64) 対応。Intel Mac / Apple Silicon Mac 両対応のユニバーサルバイナリとしてビルドされ、実機(macOS 26 / arm64)で動作確認済み。
- Fileメニュー(Open〜SaveAll)のダイアログが表示されない不具合の修正
- マニュアルが開かない不具合の修正
- 言語切替時に再起動が必要であることをユーザーに案内していなかった問題の修正
- その他、細かな不具合修正・バージョンアップ

## 免責事項
このソフトは無保証・無責任です。以下の条件に同意していただける場合にのみ、このソフトをご利用いただくことができます。
- 作者は、このソフトによって発生した損害に関し、一切の責任を負わない。
- 作者は、このソフトのサポート ( 不具合修正・バージョンアップなど ) に関する一切の義務を負わない。

## ビルドと実行

### 開発環境
- Apple LLVM version 6.0以上
- [Qt](https://www.qt.io/download) 6.12.0以上（Apple Silicon / Intel Mac 両対応のユニバーサルバイナリとしてビルドするため、公式のユニバーサル配布があるQt6を使用しています）
- [CMake](https://cmake.org/download/) 3.18以上
- サウンド関連の実装には、高性能オーディオライブラリ「BASS」を使用しています。有用なライブラリを公開なさっている Ian Luck 氏に、深く感謝致します。

  Un4seen Developments : http://www.un4seen.com/

### ビルド
リポジトリ直下の `build.command` を実行すると、CMakeによる生成・ビルド・`macdeployqt`によるフレームワーク同梱・ad-hoc コード署名（Apple Siliconや現在のGatekeeperポリシーでは、署名の無いバイナリはそのままでは実行できないため）・ビルド時生成ファイルの後始末までを一括で行い、直下に `Hayaemon.app` が生成されます。
```
./build.command
```
`build.command` 内の `QT_DIR` は既定で `$HOME/Qt/6.12.0/macos` を指しているので、Qtのインストール先が異なる場合はこのパスを書き換えてください。

手動でビルドする場合は、任意のビルドディレクトリで以下を実行します。
```
cmake (クローンした聞々ハヤえもんのリポジトリ) -DCMAKE_PREFIX_PATH=(Qt6インストール先のmacosディレクトリ)
make
```

### 実行
```
open ./Hayaemon.app/
```

## ライセンス
[GPL v3 ライセンス](https://www.gnu.org/licenses/gpl-3.0.html)
