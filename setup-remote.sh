#!/bin/bash
echo "GitHubリポジトリのURLを入力してください（例: https://github.com/username/neighborhoods-portfolio.git）:"
read REPO_URL
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"
git branch -M main
git push -u origin main
