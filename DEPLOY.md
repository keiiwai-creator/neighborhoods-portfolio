# Neighborhoods Portfolio - デプロイ手順

## GitHub Pagesで公開する手順

1. GitHubでリポジトリを作成：
   - https://github.com/new にアクセス
   - Repository name: `neighborhoods-portfolio`
   - Public を選択
   - "Initialize this repository with a README" はチェックしない
   - "Create repository" をクリック

2. 以下のコマンドを実行してリモートリポジトリに接続：

```bash
cd "/Volumes/KEIのSSD/Cursor/portfolio"
git remote add origin https://github.com/YOUR_USERNAME/neighborhoods-portfolio.git
git branch -M main
git push -u origin main
```

3. GitHub Pagesを有効化：
   - リポジトリの Settings > Pages に移動
   - Source: "Deploy from a branch" を選択
   - Branch: "main" を選択
   - Folder: "/ (root)" を選択
   - Save をクリック

4. 数分後にサイトが公開されます：
   - URL: https://YOUR_USERNAME.github.io/neighborhoods-portfolio/



