class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/homebrew-sysinfo"
  url "https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1daa6c7b2d142d5f32fd33e04e5e9815082550df959fedc5e1d742d056bb14d4"
  license "MIT"
  head "https://github.com/SKT-Shurima/homebrew-sysinfo.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 