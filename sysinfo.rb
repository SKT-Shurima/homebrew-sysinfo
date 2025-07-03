class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/homebrew-sysinfo"
  url "https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "ec61bfcc03e148916d604115bb07d4d710676d06ad09b74bd21552d19fb1cf5e"
  license "MIT"
  head "https://github.com/SKT-Shurima/homebrew-sysinfo.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 