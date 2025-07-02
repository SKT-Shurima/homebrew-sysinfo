class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/homebrew-sysinfo"
  url "https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1c1fa09e304f3b174e072e95d112a6349350f6a87d2a476b9d2921ee3ec368a4"
  license "MIT"
  head "https://github.com/SKT-Shurima/homebrew-sysinfo.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 