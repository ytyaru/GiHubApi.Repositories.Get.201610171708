# このソフトウェアについて #

GiHubApi.Repositories.Get.201610171708は私個人が学習目的で作成したソフトウェアである。

自分のアカウント配下にあるリモートリポジトリの情報を取得するバッチ。

# 開発環境 #

* Windows XP Pro SP3 32bit
    * cmd.exe
* [curl.exe](https://curl.haxx.se/download.html#Win32)
    * 7.24.0
* [q.exe](http://harelba.github.io/q/ja/index.html)
    * 1.5.0

## WebService ##

* [GitHub](https://github.com/)

# 手順

## 準備

1. [GitHubアカウントを取得すること](https://github.com/join)
1. [AccessTokenを取得すること](https://github.com/settings/tokens)
1. AccessTokenのscopeで`repo`をチェックすること

以上でこのバッチで使うユーザ名とAccessTokenを取得できる。

## 実行

あらかじめリポジトリを作成しておいてから、このバッチを実行する。
`AccessToken.tsv`にユーザ名、AccessToken、TokenDescriptionを設定しておく。（カラム名はバッチのコードを参照）
ユーザ名とTokenDescriptionが`RepositoryControl`のもので1つだけ取得する条件で正常に動作する。

1. `GiHubApi.Repository.Get.bat`をテキストエディタで開く
1. `GITHUB_USER`にユーザ名をセットし保存する
1. `GiHubApi.Repository.Get.bat`をダブルクリックして実行する
1. jsonファイルができる

# ライセンス #

このソフトウェアはCC0ライセンスです。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
