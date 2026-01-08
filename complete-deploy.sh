#!/bin/bash

echo "🚀 Neighborhoods Portfolio 完全自動デプロイ"
echo ""

# Personal Access Tokenを取得
echo "GitHub Personal Access Tokenを入力してください:"
echo "（作成方法: https://github.com/settings/tokens/new）"
echo "必要な権限: repo (全てのリポジトリへのアクセス)"
read -s TOKEN

if [ -z "$TOKEN" ]; then
    echo "❌ トークンが入力されませんでした"
    exit 1
fi

echo ""
echo "📤 GitHubにプッシュ中..."

# トークンを使ってプッシュ
git push https://${TOKEN}@github.com/keiiwai-creator/neighborhoods-portfolio.git main

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ プッシュに失敗しました"
    exit 1
fi

echo ""
echo "✅ プッシュ完了！"
echo ""
echo "🌐 GitHub Pagesを有効化中..."

# GitHub Pagesを有効化
sleep 2
RESPONSE=$(curl -s -X POST \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Content-Type: application/json" \
    "https://api.github.com/repos/keiiwai-creator/neighborhoods-portfolio/pages" \
    -d '{"source":{"branch":"main","path":"/"}}')

if echo "$RESPONSE" | grep -q "\"url\""; then
    echo "✅ GitHub Pagesを有効化しました！"
elif echo "$RESPONSE" | grep -q "already exists"; then
    echo "✅ GitHub Pagesは既に有効化されています"
else
    echo "⚠️  GitHub Pagesの自動有効化に失敗しました"
    echo "   手動で有効化してください:"
    echo "   https://github.com/keiiwai-creator/neighborhoods-portfolio/settings/pages"
fi

echo ""
echo "🎉 デプロイ完了！"
echo ""
echo "   数分後にサイトが公開されます:"
echo "   https://keiiwai-creator.github.io/neighborhoods-portfolio/"
echo ""



