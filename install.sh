#!/bin/bash

# Sysinfo 工具安装脚本
# 用于设置 Homebrew tap 并安装 sysinfo 工具

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo -e "${BLUE}🚀 Sysinfo 工具安装脚本${RESET}\n"

# 检查是否安装了 Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ 未检测到 Homebrew${RESET}"
    echo -e "${YELLOW}请先安装 Homebrew:${RESET}"
    echo -e "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo -e "${GREEN}✅ 检测到 Homebrew${RESET}"

# 添加 tap
echo -e "\n${BLUE}📦 添加 Homebrew tap...${RESET}"
brew tap SKT-Shurima/brew-tools

# 安装 sysinfo
echo -e "\n${BLUE}🔧 安装 sysinfo 工具...${RESET}"
brew install sysinfo

# 验证安装
echo -e "\n${BLUE}✅ 验证安装...${RESET}"
if command -v sysinfo &> /dev/null; then
    echo -e "${GREEN}✅ sysinfo 安装成功！${RESET}"
    echo -e "\n${BLUE}📖 使用方法:${RESET}"
    echo -e "  sysinfo              # 显示所有信息"
    echo -e "  sysinfo --net        # 只显示网络信息"
    echo -e "  sysinfo --system     # 只显示系统信息"
    echo -e "  sysinfo --docker     # 只显示Docker信息"
    echo -e "  sysinfo --help       # 显示帮助信息"
else
    echo -e "${RED}❌ 安装失败${RESET}"
    exit 1
fi

echo -e "\n${GREEN}🎉 安装完成！现在可以使用 sysinfo 命令了。${RESET}" 