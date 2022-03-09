# z80oolong/diy -- Linuxbrew の拡張コマンド ```brew diy, brew switch``` を導入する為の Tap リポジトリ

## 概要

[Linuxbrew][BREW] とは、Linux の各ディストリビューションにおけるソースコードの取得及びビルドに基づいたパッケージ管理システムです。 [Linuxbrew][BREW] の使用により、ソースコードからのビルドに基づいたソフトウェアの導入を単純かつ容易に行うことが出来ます。

現在、 [Linuxbrew][BREW] には多くのパッケージが含まれており、多様なパッケージを容易にインストールすることが可能ですが、幾つかのソフトウェアに関しては [Linuxbrew][BREW] のパッケージに含まれず、また、システム側のパッケージに含まれないものが存在します。

このような場合、パッケージとして提供されていないソフトウェアのソースコードを手動でダウンロードした上でビルドし、 ```/usr/local``` のような適当なディレクトリにインストールする手法が取られますが、そのまま適当なディレクトリにソフトウェアをインストールすると、ソフトウェアをアップグレードしたりアンインストールする場合に作業が非常に煩雑になる問題が発生します。

ここで Linux の各ディストリビューションに [Linuxbrew][BREW] が導入されている場合は、 ```brew diy```, ```brew --cellar``` , ```brew link```, ```brew unlink``` 及び ```brew switch``` コマンドを用いることにより、 [Linuxbrew][BREW] と統合的に各種パッケージとして提供されていないソフトウェアをパッケージとして管理することが可能になります。

しかし、 2022/03/09 時点において、 ```brew diy``` コマンド及び ```brew switch``` コマンドは [Linuxbrew][BREW] 本体から削除されており、これらのコマンドが実行できない状態となっております。

本リポジトリは、 [Linuxbrew][BREW] を用いて、システム及び [Linuxbrew][BREW] のパッケージとして提供されていないソフトウェアをソースコードからビルドしてインストールし、パッケージとして管理する為に必要となる [Linuxbrew][BREW] の拡張コマンドである ```brew diy, brew switch``` を再導入する為の [Linuxbrew][BREW] 向けの Tap リポジトリです。

## 使用法

まず最初に、以下に示す Qiita の投稿及び Web ページの記述に基づいて、手元の端末に [Linuxbrew][BREW] を構築し、以下のように  ```brew tap``` コマンドを用いて本リポジトリを導入します。

- [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" の投稿
- [Linuxbrew の公式ページ][BREW]

そして、本リポジトリを以下のようにインストールします。

```
 $ brew tap z80oolong/diy
```

なお、本リポジトリに含まれる ```brew``` の拡張コマンドの一覧及びその詳細については、本リポジトリに同梱する ```CommandList.md``` を参照して下さい。

## その他詳細について

その他、本リポジトリ及び [Linuxbrew][BREW] の使用についての詳細は ```brew help``` コマンド及び  ```man brew``` コマンドの内容、若しくは [Linuxbrew の公式ページ][BREW]を御覧下さい。


## 謝辞

まず最初に、各種 Linux ディストリビューションにおけるソースコードの取得及びビルドに基づいたパッケージ管理システムである [Linuxbrew][BREW] の開発に関わる [Linuxbrew][BREW] の開発コミュニティの各位に心より感謝致します。

そして、[Linuxbrew][BREW] の導入に関しては、 [Linuxbrew の公式ページ][BREW] の他、 [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" 及び [Linuxbrew][BREW] 関連の各種資料を参考にしました。 [Linuxbrew の開発コミュニティ][BREW]及び[thermes 氏][THER]を始めとする各氏に心より感謝致します。

そして最後に、 [Linuxbrew][BREW] に関わる全ての皆様に心より感謝致します。

## 使用条件

本リポジトリは、 [Linuxbrew][BREW] の Tap リポジトリの一つとして、 [Linuxbrew の開発コミュニティ][BREW]及び [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有し、[Linuxbrew][BREW] のライセンスと同様である [BSD 2-Clause License][BSD2] に基づいて配布されるものとします。詳細については、本リポジトリに同梱する ```LICENSE``` を参照して下さい。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[THER]:https://qiita.com/thermes
[THBR]:https://qiita.com/thermes/items/926b478ff6e3758ecfea
[BSD2]:https://opensource.org/licenses/BSD-2-Clause
[ZOOL]:http://zool.jpn.org/
