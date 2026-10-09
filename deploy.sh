#!/bin/bash
# GitHub Pages 部署脚本
# 用法: ./deploy.sh <你的GitHub用户名> [仓库名]

set -e
USERNAME=${1:-YOUR_GITHUB_USERNAME}
REPO=${2:-zkj-ai-monitoring}

echo "=========================================="
echo " GitHub Pages 部署脚本"
echo "=========================================="
echo "目标仓库: $USERNAME/$REPO"
echo ""

# 配置 git 用户（如果未配置）
if [ -z "$(git config --global user.name)" ]; then
  echo "请输入你的 GitHub 用户名："
  read -p "Name: " GIT_NAME
  git config --global user.name "$GIT_NAME"
fi
if [ -z "$(git config --global user.email)" ]; then
  echo "请输入你的 GitHub 邮箱："
  read -p "Email: " GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

# 初始化仓库
if [ ! -d .git ]; then
  echo "→ 初始化 git 仓库..."
  git init
  git branch -M main
fi

echo "→ 添加文件到 git..."
git add .

# 检查是否已有 commit
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  echo "→ 检测到已有 commit，检查变更..."
  if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "chore: deploy update $(date '+%Y-%m-%d %H:%M:%S')"
  fi
else
  echo "→ 创建首次 commit..."
  git commit -m "feat: initial deploy of 中科炼化AI智慧安全监控系统"
fi

# 添加远程仓库
REMOTE_URL="https://github.com/$USERNAME/$REPO.git"
echo ""
echo "→ 即将推送到: $REMOTE_URL"
echo ""

if git remote | grep -q "^origin$"; then
  echo "→ origin 远程已存在，更新 URL..."
  git remote set-url origin "$REMOTE_URL"
else
  echo "→ 添加 origin 远程..."
  git remote add origin "$REMOTE_URL"
fi

echo ""
echo "=========================================="
echo " 准备推送！"
echo "=========================================="
echo "如果遇到认证问题，请先在 GitHub 创建 Personal Access Token:"
echo "  https://github.com/settings/tokens"
echo ""
echo "然后将 token 作为密码输入。"
echo ""
echo "按 Ctrl+C 取消，或回车继续推送..."
read -r

echo "→ 推送到 main 分支..."
git push -u origin main --force

echo ""
echo "=========================================="
echo " 部署完成！"
echo "=========================================="
echo "访问地址: https://$USERNAME.github.io/$REPO/"
echo ""
echo "提示: GitHub Pages 需要 1-2 分钟才能生效"
echo "请到仓库 Settings → Pages 查看部署状态"
