class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/homebrew-sysinfo"
  url "https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "9ffb89a6f69fc5d5ec8052d8eb906a6846991e4ebd0ac957376f0a1eb83eae94"
  license "MIT"
  head "https://github.com/SKT-Shurima/homebrew-sysinfo.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 