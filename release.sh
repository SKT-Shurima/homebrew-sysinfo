#!/bin/bash

# 自动化发布脚本
# 使用方法: ./release.sh <版本号>
# 例如: ./release.sh 1.0.1

set -e

if [ $# -eq 0 ]; then
    echo "使用方法: $0 <版本号>"
    echo "例如: $0 1.0.1"
    exit 1
fi

VERSION=$1
REPO_URL="https://github.com/SKT-Shurima/homebrew-sysinfo"

echo "开始发布版本 v$VERSION..."

# 1. 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "错误: 有未提交的更改，请先提交所有更改"
    git status
    exit 1
fi

# 2. 更新 Formula 中的版本号
# 以及 sysinfo 脚本中的版本号

echo "更新 sysinfo 脚本中的版本号..."
sed -i.bak "s|^SYSINFO_VERSION=\".*\"|SYSINFO_VERSION=\"$VERSION\"|" sysinfo
rm sysinfo.bak

echo "更新 Formula 中的版本号..."
sed -i.bak "s|url \"$REPO_URL/archive/refs/tags/v[0-9.]*\.tar\.gz\"|url \"$REPO_URL/archive/refs/tags/v$VERSION.tar.gz\"|" sysinfo.rb
rm sysinfo.rb.bak

# 3. 提交更改
echo "提交版本更新..."
git add sysinfo.rb
git commit -m "准备发布 v$VERSION"

# 4. 创建标签
echo "创建标签 v$VERSION..."
git tag v$VERSION

# 5. 推送到远程仓库
echo "推送到远程仓库..."
git push origin main
git push origin v$VERSION

# 6. 等待 GitHub 生成发布包
echo "等待 GitHub 生成发布包..."
sleep 10

# 7. 计算 SHA256
echo "计算 SHA256..."
SHA256=$(curl -L "$REPO_URL/archive/refs/tags/v$VERSION.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "SHA256: $SHA256"

# 8. 更新 Formula 中的 SHA256
echo "更新 Formula 中的 SHA256..."
sed -i.bak "s|sha256 \"[a-f0-9]*\"|sha256 \"$SHA256\"|" sysinfo.rb
rm sysinfo.rb.bak

# 9. 提交 SHA256 更新
echo "提交 SHA256 更新..."
git add sysinfo.rb
git commit -m "更新 v$VERSION 的 SHA256: $SHA256"
git push origin main

# 10. 测试安装
echo "测试 Formula 安装..."
brew uninstall sysinfo 2>/dev/null || true
brew install --build-from-source ./sysinfo.rb

echo "✅ 版本 v$VERSION 发布完成！"
echo "📦 下载链接: $REPO_URL/archive/refs/tags/v$VERSION.tar.gz"
echo "�� SHA256: $SHA256" 