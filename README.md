# Hello Selenium

Selenium を使って Web サイトのテストを行うサンプルプログラムです．

テストは Ruby を使って実装しています．

実行環境は，Docker と Vagrant を用意しています．


## テスト内容

各種検索エンジン (Google, DuckDuckGo, Yahoo! JAPAN) で "Ruby" という
キーワードを検索すると，
プログラミング言語 Ruby のサイト https://www.ruby-lang.org/ がトップヒットすることをテストします．


## 実行環境

実行環境として Docker イメージと，Vagrant で構築できる仮想マシンを用意しています．

OS のイメージは Ubuntu となっています．
いずれの環境でも，Ruby 2.5.0，Firefox，Selenium geckodriver が導入されます．

### Docker

このリポジトリの Dockerfile を使ってビルドを行なってください．

```
$ docker build -t hello-selenium .
```

あるいは [Docker Hub のイメージ](https://hub.docker.com/r/snobutaka/hello-selenium/) をプルすることもできます．

```
$ docker pull snobutaka/hello-selenium
```

コンテナを起動すると，Selenium によるテストが実行されます．

```
$ docker run --rm -t snobutaka/hello-selenium
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]
Loaded suite /tests/firefox_headless_test
Started
...
Finished in 31.980693 seconds.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
3 tests, 3 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
0.09 tests/s, 0.09 assertions/s
```


### Vagrant

このリポジトリの Vagrantfile を使って ``vagrant up`` を実行してください．

```
$ vagrant up
```

デスクトップ環境として導入してある Xfce を起動し，
VirtualBox から GUI を使ってブラウザの画面を起動して (headless モードでなく) テストを実行できます．

```
$ sudo startx &
# (VirtualBox 等の画面を開く)
$ ruby /vagrant/tests/firefox_test.rb
```
