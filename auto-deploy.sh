#!/bin/bash

# Neighborhoods Portfolio 完全自動デプロイスクリプト

REPO_NAME="neighborhoods-portfolio"
GITHUB_USERNAME=""
GITHUB_TOKEN=""

echo "🚀 Neighborhoods Portfolio 完全自動デプロイ"
echo ""

# GitHubユーザー名を取得
if [ -z "$GITHUB_USERNAME" ]; then
    echo "GitHubユーザー名を入力してください:"
    read GITHUB_USERNAME
fi

# GitHub Personal Access Tokenを取得
if [ -z "$GITHUB_TOKEN" ]; then
    echo ""
    echo "GitHub Personal Access Tokenが必要です"
    echo "作成方法: https://github.com/settings/tokens/new"
    echo "必要な権限: repo (全てのリポジトリへのアクセス)"
    echo ""
    echo "Personal Access Tokenを入力してください:"
    read -s GITHUB_TOKEN
    echo ""
fi

# GitHubリポジトリを作成
echo "📦 GitHubリポジトリを作成中..."
RESPONSE=$(curl -s -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d "{\"name\":\"$REPO_NAME\",\"description\":\"Neighborhoods portfolio website\",\"private\":false}")

# リポジトリが既に存在するか確認
if echo "$RESPONSE" | grep -q "already exists"; then
    echo "✅ リポジトリは既に存在します"
elif echo "$RESPONSE" | grep -q "Bad credentials"; then
    echo "❌ 認証に失敗しました。トークンを確認してください"
    exit 1
elif echo "$RESPONSE" | grep -q "\"name\""; then
    echo "✅ リポジトリを作成しました"
else
    echo "⚠️  リポジトリの作成に失敗しました。手動で作成してください:"
    echo "   https://github.com/new?name=$REPO_NAME"
fi

# リモートリポジトリを設定
echo "🔗 リモートリポジトリを設定中..."
git remote remove origin 2>/dev/null
git remote add origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# ブランチをmainに設定
git branch -M main

# 変更をコミット
echo "💾 変更をコミット中..."
git add .
git commit -m "Deploy Neighborhoods portfolio website" || echo "変更なし"

# GitHubにプッシュ
echo "📤 GitHubにプッシュ中..."
git push -u origin main --force

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ デプロイ完了！"
    echo ""
    echo "🌐 GitHub Pagesを有効化中..."
    
    # GitHub Pagesを有効化
    sleep 2
    curl -s -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Content-Type: application/json" \
        "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pages" \
        -d '{"source":{"branch":"main","path":"/"}}' > /dev/null
    
    echo ""
    echo "🎉 サイトが公開されました！"
    echo "   URL: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "   (数分かかる場合があります)"
else
    echo ""
    echo "❌ プッシュに失敗しました"
    exit 1
fi



