# VRCDynamicPoster

Forked from [shino-hinaduki/VRCDynamicPoster](https://github.com/shino-hinaduki/VRCDynamicPoster).

## 自分用メモ

タグごとにワールドのリストを作成する.
`asset/XXX` が一つのリストに対応している.
一つのワールドに複数タグがついてる場合でも重複して異なるディレクトリに存在させる.

```bash
# ワールドを追加する
make add ID=wrld_*** TAG=XXX  # タグを先に与える場合
make add ID=wrld_***          # タグを後で選ぶ場合, peco が起動して選択する, 複数選択可

# 新しいタグを追加する
echo "XXX	素敵なワールド" >> asset/README
mkdir -p asset/XXX

# 動画ファイルのビルド
make build
ls -lh dst/
```

## 成果物

`fav` の部分はタグなので適宜他に置き換える

https://cympfh.github.io/VRCDynamicPoster/fav/index.mp4
https://cympfh.github.io/VRCDynamicPoster/fav/poster.mp4
