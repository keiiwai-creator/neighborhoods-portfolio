#!/bin/bash

# Neighborhoods Portfolio デプロイスクリプト

REPO_NAME="neighborhoods-portfolio"
GITHUB_USERNAME=""

echo "🚀 Neighborhoods Portfolio デプロイスクリプト"
echo ""

# GitHubユーザー名を取得
if [ -z "$GITHUB_USERNAME" ]; then
    echo "GitHubユーザー名を入力してください:"
    read GITHUB_USERNAME
fi

# リモートリポジトリが既に設定されているか確認
if git remote get-url origin > /dev/null 2>&1; then
    echo "✅ リモートリポジトリは既に設定されています"
    REMOTE_URL=$(git remote get-url origin)
    echo "   リモートURL: $REMOTE_URL"
else
    echo "📦 リモートリポジトリを設定中..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

# ブランチをmainに設定
git branch -M main

# 変更をコミット
echo "💾 変更をコミット中..."
git add .
git commit -m "Deploy Neighborhoods portfolio website" || echo "変更なし"

# GitHubにプッシュ
echo "📤 GitHubにプッシュ中..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ デプロイ完了！"
    echo ""
    echo "🌐 GitHub Pagesを有効化してください:"
    echo "   1. https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages にアクセス"
    echo "   2. Source: 'Deploy from a branch' を選択"
    echo "   3. Branch: 'main' を選択"
    echo "   4. Folder: '/ (root)' を選択"
    echo "   5. Save をクリック"
    echo ""
    echo "   数分後にサイトが公開されます:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
else
    echo ""
    echo "❌ プッシュに失敗しました"
    echo "   GitHubリポジトリが作成されているか確認してください:"
    echo "   https://github.com/new?name=$REPO_NAME"
fi

