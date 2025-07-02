# 发布指南

本文档说明如何发布新版本的 sysinfo 工具。

## 发布流程

### 1. 准备发布

1. 确保所有更改都已提交到 `main` 分支
2. 更新版本号（如果需要）
3. 更新 `README.md` 中的更新日志

### 2. 创建 Git Tag

```bash
# 创建新的 tag
git tag v1.0.0

# 推送 tag 到远程仓库
git push origin v1.0.0
```

### 3. 更新 Homebrew Formula

1. 等待 GitHub 自动创建 release（基于 tag）
2. 获取 release 的下载链接
3. 计算 SHA256 校验和

```bash
# 计算 SHA256
curl -L https://github.com/SKT-Shurima/brew-tools/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
```

4. 更新 `Formula/sysinfo.rb` 文件：
   - 更新 `url` 字段为新的 release URL
   - 更新 `sha256` 字段为计算出的校验和

### 4. 测试安装

```bash
# 本地测试 formula
brew install --build-from-source ./Formula/sysinfo.rb

# 测试功能
brew test sysinfo
```

### 5. 提交更改

```bash
git add Formula/sysinfo.rb
git commit -m "Update formula for v1.0.0"
git push origin main
```

## 版本号规则

使用语义化版本号：`MAJOR.MINOR.PATCH`

- `MAJOR`: 不兼容的 API 更改
- `MINOR`: 向后兼容的功能添加
- `PATCH`: 向后兼容的 bug 修复

## 示例发布流程

### 发布 v1.0.1

1. 创建 tag：
```bash
git tag v1.0.1
git push origin v1.0.1
```

2. 计算 SHA256：
```bash
curl -L https://github.com/SKT-Shurima/brew-tools/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256
# 输出: abc123def456...
```

3. 更新 Formula：
```ruby
class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/brew-tools"
  url "https://github.com/SKT-Shurima/brew-tools/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "abc123def456..."  # 更新为新计算的 SHA256
  license "MIT"
  head "https://github.com/SKT-Shurima/brew-tools.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end
```

4. 提交更改：
```bash
git add Formula/sysinfo.rb
git commit -m "Update formula for v1.0.1"
git push origin main
```

## 用户安装

用户可以通过以下命令安装最新版本：

```bash
# 添加 tap（首次安装）
brew tap SKT-Shurima/brew-tools

# 安装工具
brew install sysinfo

# 更新到最新版本
brew upgrade sysinfo
```

## 故障排除

### 如果 Formula 安装失败

1. 检查 URL 是否正确
2. 验证 SHA256 校验和
3. 确保 GitHub release 已创建
4. 检查 Formula 语法是否正确

### 如果用户无法安装

1. 确保 tap 已正确添加
2. 检查网络连接
3. 尝试清理 Homebrew 缓存：
```bash
brew cleanup
brew update
``` 