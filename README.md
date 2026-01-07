# Neighborhoods Portfolio

大田区のイベント運営・SNS動画制作サービス

## GitHub Pagesで公開する手順

### 1. GitHubリポジトリのURLを確認する方法

1. **GitHubにログイン**して、右上のプロフィールアイコンをクリック
2. **"Your repositories"** をクリック
3. **"neighborhoods-portfolio"** というリポジトリを探してクリック
4. 緑色の **"Code"** ボタンをクリック
5. 表示されるURLをコピー（例: `https://github.com/your-username/neighborhoods-portfolio.git`）

### 2. デプロイ方法

ターミナルで以下のコマンドを実行：

```bash
cd "/Volumes/KEIのSSD/Cursor/portfolio"
./quick-deploy.sh
```

リポジトリURLを聞かれたら、上記でコピーしたURLを貼り付けてEnterを押してください。

### 3. GitHub Pagesを有効化

1. リポジトリのページで **"Settings"** タブをクリック
2. 左メニューから **"Pages"** をクリック
3. **Source** で **"Deploy from a branch"** を選択
4. **Branch** で **"main"** を選択
5. **Folder** で **"/ (root)"** を選択
6. **Save** をクリック

数分後にサイトが公開されます：
`https://your-username.github.io/neighborhoods-portfolio/`

