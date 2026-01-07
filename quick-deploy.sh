#!/bin/bash
echo "GitHubリポジトリのURLを入力してください:"
echo "例: https://github.com/your-username/neighborhoods-portfolio.git"
read REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ URLが入力されませんでした"
    exit 1
fi

echo "📦 リモートリポジトリを設定中..."
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"

echo "💾 変更をコミット中..."
git add .
git commit -m "Deploy Neighborhoods portfolio website" || echo "変更なし"

echo "📤 GitHubにプッシュ中..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ プッシュ完了！"
    echo ""
    echo "🌐 GitHub Pagesを有効化してください:"
    echo "   1. https://github.com/$(echo $REPO_URL | sed 's|.*github.com/||' | sed 's|/.*||')/neighborhoods-portfolio/settings/pages にアクセス"
    echo "   2. Source: 'Deploy from a branch' を選択"
    echo "   3. Branch: 'main' を選択"
    echo "   4. Folder: '/ (root)' を選択"
    echo "   5. Save をクリック"
    echo ""
    USERNAME=$(echo $REPO_URL | sed 's|.*github.com/||' | sed 's|/.*||')
    echo "   数分後にサイトが公開されます:"
    echo "   https://$USERNAME.github.io/neighborhoods-portfolio/"
else
    echo ""
    echo "❌ プッシュに失敗しました"
    exit 1
fi
