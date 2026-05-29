class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.17"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.17/streamdrop-cli-macos-x64"
      sha256 "c7295408bf211d96f85b4aa660ec30bb9833a557f0bb653e1b52efad7cc0e8f3"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.17/streamdrop-cli-macos-arm64"
      sha256 "dbe9a31ca5730efb4c1b23a27036cdf951d96ffa9bfbd37fae22fd5048f76356"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.17/streamdrop-cli-linux-x64"
      sha256 "ffc78e643cee612acf19673baea82c2dbf4d7f22c4d86e64f4a67ccc46281f98"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "streamdrop-cli-macos-x64" => "streamdrop"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "streamdrop-cli-macos-arm64" => "streamdrop"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "streamdrop-cli-linux-x64" => "streamdrop"
    end
  end

  test do
    system "#{bin}/streamdrop", "--help"
  end
end

