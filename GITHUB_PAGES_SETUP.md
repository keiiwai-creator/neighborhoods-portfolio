# GitHub Pages セットアップ手順

## 1. Personal Access Tokenを作成

1. https://github.com/settings/tokens/new にアクセス
2. Note: "Neighborhoods Portfolio Deploy" と入力
3. Expiration: 適切な期間を選択（例: 90 days）
4. Select scopes: **repo** にチェック（全てのリポジトリへのアクセス）
5. "Generate token" をクリック
6. 表示されるトークンをコピー（一度しか表示されません）

## 2. プッシュ

ターミナルで以下のコマンドを実行：

```bash
cd "/Volumes/KEIのSSD/Cursor/portfolio"
./push-with-token.sh
```

トークンを貼り付けてEnterを押してください。

## 3. GitHub Pagesを有効化

1. https://github.com/keiiwai-creator/neighborhoods-portfolio/settings/pages にアクセス
2. Source: **"Deploy from a branch"** を選択
3. Branch: **"main"** を選択
4. Folder: **"/ (root)"** を選択
5. **Save** をクリック

数分後にサイトが公開されます：
**https://keiiwai-creator.github.io/neighborhoods-portfolio/**
