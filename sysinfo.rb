class Sysinfo < Formula
  desc "A comprehensive system and network information tool"
  homepage "https://github.com/SKT-Shurima/homebrew-sysinfo"
  url "https://github.com/SKT-Shurima/homebrew-sysinfo/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "bebf9a9d1cf13906cdc326751f2be7893bb62c5b66a51cb6f6a22d2f8d7d4d61"
  license "MIT"
  head "https://github.com/SKT-Shurima/homebrew-sysinfo.git", branch: "main"

  def install
    bin.install "sysinfo"
  end

  test do
    system "#{bin}/sysinfo", "--help"
  end
end 