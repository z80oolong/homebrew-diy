# z80oolong/appimage に含まれる ```brew``` の拡張コマンド一覧

## 概要

本文書では、 [Linuxbrew][BREW] 向け Tap リポジトリ z80oolong/appimage によって拡張される ```brew``` コマンド一覧を示します。各コマンドの詳細等については ```brew <command> --help``` の出力も併せて参照して下さい。

なお、 ```brew diy``` コマンド及び ```brew switch``` コマンドの仕様についての詳細については、 "[Linuxbrew 若しくは Homebrew を用いた野良ビルドパッケージの管理手法][QIIT]" を参照して下さい。

## 拡張コマンド一覧

### ```brew diy```

```brew diy``` コマンドは、カレントディレクトリにソフトウェアのビルドで使用する ```configure``` スクリプト若しくは ```cmake``` コマンドで使用する ```CMakeLists.txt``` ファイルが存在し、かつ、カレントディレクトリの basename が ```name-x.y.z``` (ここで、 x, y, z はバージョン番号を表す整数) のような形式である場合に、 ```configure``` スクリプト及び ```cmake``` コマンドにソフトウェアのインストール先を示す引数を渡すのに適切なオプションを標準出力に返すコマンドです。

- ```--name``` … インストール先となるパッケージ名を明示的に指定します。
- ```--version``` … インストール先となるバージョン番号を明示的に指定します。
- ```-m, --cmakelists``` … カレントディレクトリの内容に関わらず、 ```cmake``` 向けのオプションである ```-DCMAKE_INSTALL_PREFIX=path``` を出力します。
- ```-c, --configure``` … カレントディレクトリの内容に関わらず、 ```configure``` 向けのオプションである ```--prefix=path``` を出力します。
- ```-M, --meson``` … カレントディレクトリの内容に関わらず、 ```meson``` 向けのオプションである ```-Dprefix=path``` を出``` を出力します。
- ```-o, --manually``` … カレントディレクトリの内容に関わらず、インストール先となるディレクトリをそのまま出力します。

### ```brew switch```

```brew switch``` コマンドは、 ```brew link``` コマンド及び ```brew install``` コマンド等によってインストールされたパッケージにおいて、これらのパッケージの新たなバージョンをインストールした場合に、これらのパッケージの [Linuxbrew][BREW] の導入先のディレクトリ以下のシンボリックリンクを完全に削除し、 ```brew switch``` コマンドによって指定したパッケージ及びバージョンの実体が置かれているディレクトリ下の各ファイルから、 [Linuxbrew][BREW] の導入先のディレクトリ以下にシンボリックリンクを作成し直すためのコマンドです。

例えば、既に ```brew link``` コマンドによって、バージョン番号が 0.0.1 であるパッケージ ```foobar``` がインストールされており、その後パッケージ ```foobar``` のバージョン番号を 0.0.2 にアップグレードする場合、新しいバージョンのパッケージの実体を ```/home/user/.linuxbrew/Cellar/foobar/0.0.2``` に置き、 ```brew switch``` コマンドを以下の通りに実行します。

```
 $ brew switch foobar 0.0.2
```

なお、 ```brew switch``` コマンドにおいて、バージョン番号の引数を省略すると、引数で指定されたパッケージについて、インストールされている全てのバージョン番号が出力されます。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[QIIT]:https://qiita.com/z80oolong/items/dd3b8e5024c36df9b35b
