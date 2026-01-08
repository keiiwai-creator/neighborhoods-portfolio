#!/bin/bash

echo "🔐 GitHub Personal Access Tokenを使用してプッシュします"
echo ""
echo "Personal Access Tokenを入力してください:"
echo "（作成方法: https://github.com/settings/tokens/new）"
echo "必要な権限: repo (全てのリポジトリへのアクセス)"
echo ""
read -s TOKEN

if [ -z "$TOKEN" ]; then
    echo "❌ トークンが入力されませんでした"
    exit 1
fi

echo ""
echo "📤 GitHubにプッシュ中..."

# トークンを使ってプッシュ
git push https://${TOKEN}@github.com/keiiwai-creator/neighborhoods-portfolio.git main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ プッシュ完了！"
    echo ""
    echo "🌐 GitHub Pagesを有効化してください:"
    echo "   https://github.com/keiiwai-creator/neighborhoods-portfolio/settings/pages"
    echo ""
    echo "   1. Source: 'Deploy from a branch' を選択"
    echo "   2. Branch: 'main' を選択"
    echo "   3. Folder: '/ (root)' を選択"
    echo "   4. Save をクリック"
    echo ""
    echo "   数分後にサイトが公開されます:"
    echo "   https://keiiwai-creator.github.io/neighborhoods-portfolio/"
else
    echo ""
    echo "❌ プッシュに失敗しました"
    exit 1
fi



