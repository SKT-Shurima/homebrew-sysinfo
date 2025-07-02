class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/brew-tools"
  url "https://github.com/SKT-Shurima/brew-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "SKIP"  # 首次发布时使用 SKIP，后续发布需要计算实际的 SHA256
  license "MIT"
  head "https://github.com/SKT-Shurima/brew-tools.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 