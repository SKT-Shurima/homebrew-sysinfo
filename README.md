# Sysinfo - 系统与网络信息工具

一个功能强大的系统与网络信息显示工具，支持 macOS、Linux 和 Windows (WSL/Git Bash)。

## 工具用途

Sysinfo 是一个跨平台的系统与网络信息显示工具，适用于：

- 需要快速查看本机系统、硬件、网络、Docker 信息的开发者和运维人员
- 需要在多平台（macOS、Linux、WSL、Git Bash）下统一体验的用户
- 需要美观彩色终端输出和一键获取关键信息的场景

## 功能特性

- 🖥️ **系统信息**: 显示操作系统、版本、架构、主机名等
- 🔧 **硬件信息**: CPU、内存、显卡详细信息
- 🌐 **网络信息**: 本地IP、公网IP、网络连接状态
- 🐳 **Docker信息**: Docker版本、容器状态、镜像统计
- 🎨 **彩色输出**: 美观的彩色终端输出
- 🔧 **模块化**: 支持只显示特定类型的信息

## 安装方法

### 推荐方式：通过 Homebrew Tap 安装

适用于所有用户，无需下载源码，自动获取最新版本。

```bash
# 添加自定义 tap
brew tap SKT-Shurima/homebrew-sysinfo

# 安装工具
brew install sysinfo
```

### 其他方式：手动安装

```bash
# 下载源码包
curl -L https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.0.tar.gz | tar -xz
cd homebrew-sysinfo-1.0.0

# 构建并安装
brew install --build-from-source ./sysinfo.rb
```

## 更新方法

### 通过 Homebrew 更新（推荐）

```bash
# 更新 Homebrew 和所有已安装的包
brew update

# 升级 sysinfo 到最新版本
brew upgrade sysinfo
```

### 手动更新

```bash
# 卸载旧版本
brew uninstall sysinfo

# 重新安装最新版本
brew install sysinfo
```

### 检查当前版本

```bash
# 查看已安装的版本
brew list --versions sysinfo

# 查看可用的版本信息
brew info sysinfo

# 查看 sysinfo 工具版本
sysinfo --version
```

### 更新 Tap（如果遇到版本问题）

如果发现安装的不是最新版本，可以重新添加 tap：

```bash
# 卸载当前版本
brew uninstall sysinfo

# 移除旧的 tap
brew untap SKT-Shurima/homebrew-sysinfo

# 重新添加 tap
brew tap SKT-Shurima/homebrew-sysinfo

# 安装最新版本
brew install sysinfo
```

## 使用方法

```bash
# 显示所有信息
sysinfo

# 只显示网络信息
sysinfo --net

# 只显示系统信息
sysinfo --system

# 只显示Docker信息
sysinfo --docker

# 显示帮助信息
sysinfo --help

# 显示版本信息
sysinfo --version
```

## 输出示例

```
系统与网络信息

网络连接:
✓ 互联网连接正常
→ 网关: 192.168.1.1
-----------------------------------------------

本地网络:

IPv4 地址:
  en0: 192.168.1.100
  lo0: 127.0.0.1

IPv6 地址:
  en0: fe80::1234:5678:9abc:def0%en0
-----------------------------------------------

公网IP地址:

IPv4: 
  203.0.113.1

IPv6: 
  2001:db8::1
```

## 支持的操作系统

- ✅ macOS (原生支持)
- ✅ Linux (Ubuntu, CentOS, Debian 等)
- ✅ Windows Subsystem for Linux (WSL)
- ✅ Git Bash for Windows

## 依赖要求

- `curl` - 用于获取公网IP地址
- `docker` - 用于显示Docker信息（可选）

## 开发

### 本地测试

```bash
# 测试 Homebrew formula
brew install --build-from-source ./sysinfo.rb

# 运行测试
brew test sysinfo
```

### 发布新版本

#### 自动化发布（推荐）

使用提供的自动化脚本：

```bash
# 发布新版本（例如 v1.0.1）
./release.sh 1.0.1
```

这个脚本会自动：
1. 更新 Formula 中的版本号
2. 创建 Git 标签
3. 推送到 GitHub
4. 计算并更新 SHA256
5. 测试安装

#### 手动发布

1. 创建新的 Git tag
```bash
git tag v1.0.1
git push origin v1.0.1
```

2. 更新 Formula 中的版本号和 SHA256
```bash
# 计算新的 SHA256
curl -L https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256
```

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

## 更新日志

### v1.0.4
- 🎨 **新增 One Dark 主题配色方案**：使用现代化的深色主题色彩
- 🎯 **优化视觉效果**：在深色终端环境下提供更舒适的显示效果
- 📖 **改进可读性**：优化的颜色对比度和层次结构
- 🔧 **技术改进**：使用 256 色终端代码，提供更精确的颜色控制

### v1.0.3
- 添加 `--version` 参数支持，显示版本信息
- 完善自动化发布流程
- 优化项目结构和文档

### v1.0.2
- 修复版本号同步问题
- 完善发布脚本逻辑

### v1.0.1
- 调整项目结构，将 Formula 文件移到根目录
- 添加自动化发布脚本

### v1.0.0
- 初始版本发布
- 支持系统、网络、Docker信息显示
- 支持模块化显示
- 彩色终端输出 