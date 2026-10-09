#!/bin/bash
# 一键推送（假设远程已配置）
# 首次使用: ./quick-deploy.sh <用户名> <仓库名>
# 之后: ./quick-deploy.sh

USERNAME=${1:-YOUR_USERNAME}
REPO=${2:-zkj-ai-monitoring}

# 首次设置
if ! git remote | grep -q "^origin$"; then
  git remote add origin "https://github.com/$USERNAME/$REPO.git"
fi

git add .
if ! git diff --cached --quiet 2>/dev/null; then
  git commit -m "deploy: $(date '+%Y-%m-%d %H:%M:%S')"
fi

git push -u origin main --force
echo "部署完成: https://$USERNAME.github.io/$REPO/"
