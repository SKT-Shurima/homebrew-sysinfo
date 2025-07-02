# Sysinfo - 系统与网络信息工具

一个功能强大的系统与网络信息显示工具，支持 macOS、Linux 和 Windows (WSL/Git Bash)。

## 功能特性

- 🖥️ **系统信息**: 显示操作系统、版本、架构、主机名等
- 🔧 **硬件信息**: CPU、内存、显卡详细信息
- 🌐 **网络信息**: 本地IP、公网IP、网络连接状态
- 🐳 **Docker信息**: Docker版本、容器状态、镜像统计
- 🎨 **彩色输出**: 美观的彩色终端输出
- 🔧 **模块化**: 支持只显示特定类型的信息

## 安装方法

### 通过 Homebrew 安装（推荐）

```bash
# 添加自定义 tap
brew tap SKT-Shurima/brew-tools

# 安装工具
brew install sysinfo
```

### 手动安装

```bash
# 克隆仓库
git clone https://github.com/SKT-Shurima/brew-tools.git
cd brew-tools

# 安装到系统
sudo cp sysinfo /usr/local/bin/
sudo chmod +x /usr/local/bin/sysinfo
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

1. 创建新的 Git tag
```bash
git tag v1.0.1
git push origin v1.0.1
```

2. 更新 Formula 中的版本号和 SHA256
```bash
# 计算新的 SHA256
curl -L https://github.com/SKT-Shurima/brew-tools/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256
```

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

## 更新日志

### v1.0.0
- 初始版本发布
- 支持系统、网络、Docker信息显示
- 支持模块化显示
- 彩色终端输出 