# JobHuntingCalendar

## 概要

このアプリは就活時にオンラインで行われる面接や説明会等のURLや日程などを一つのカレンダーにまとめて、管理するWebアプリです。

## ビルドに必要なソフト

- [Chrome](https://www.google.co.jp/chrome/)
- [Git for Windows](https://gitforwindows.org/)
- [Docker](https://www.docker.com/products/docker-desktop)
  - Ruby : 2.7.5
  - Ruby on Rails : 6.1.4
  - Node : 12.14.0
  - Postgresql : 13

## インストール

- Chrome
  1. インストーラーを[ダウンロード](https://www.google.co.jp/chrome/)する。
  2. ダウンロードしたファイルを実行する。

- Git
  1. インストーラーを[ダウンロード](https://gitforwindows.org/)する。
  2. ダウンロードしたファイルを実行する。
  3. 「Next」を押していき、途中「Git from the command line and also from 3rd-party software」と、選択する項目があった場合は選択すること
  4. installを押すとインストールが開始する。
  5. installが終わったらfinishを押して、終了する。

- Docker
  1. windowsのタスクバー（黒い帯）にある検索部分で、「Windowsの機能の有効かまたは無効化」で検索し、起動する。
  2. Hyper-V、WSL2(Windows Subsystem for Linux),仮想化プラットフォームを有効にして、OKをクリック。
  3. 再起動
  4. インストーラーを[ダウンロード](https://www.docker.com/products/docker-desktop)する。
  5. ダウンロードしたファイルを実行する。
  6. 初回DockerDesktop起動時にLinuxカーネルの差し替えを求められるなら、リンクをたどって更新ファイルを落とし、それからrestartする。
  7. 最終的に、Docker Desktopの左下が緑色になっていたら完了。

## 開発環境構築

- リポジトリよりクローン

```console
PS> git config --global core.autocrlf input
PS> git clone https://github.com/syu0811/JobHuntingCalendar.git
PS> cd job_hunting_calendar
```

- ビルド

```console
PS> docker-compose build
# 再度起動
PS> docker-compose up
```

- DB作成

```console
# コンテナを起動した状態
PS> docker-compose exec web bash
# 接続を確認後
$> EDITOR="vi" bin/rails credentials:edit
$> rails db:create db:migrate db:seed
```

## 本番環境(不備あり)

- 以下のコマンドを実行し、仮想コンテナを立てる。

```console
PS> del docker-compose.yml
PS> ren docker-compose.prc.yml docker-compose.yml
PS> docker-compose build
PS> docker-compose up
```

- DB作成・初期データ投入・コンパイル

```console
# コンテナを起動した状態
PS> docker-compose exec web bash
# 接続を確認後
$> EDITOR="vi" bin/rails credentials:edit
$> rails assets:precompile
$> RAILS_ENV=production rails db:create db:migrate db:seed
```

## 初期データ

- User
  - test@example.com
    - password
  - guest@example.com
    - password

## 開発者
- syu0811