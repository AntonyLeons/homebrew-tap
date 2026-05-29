class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.18"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.18/streamdrop-cli-macos-x64"
      sha256 "43770744099cfa9dbfdb5c03d041d32884a7bf8c8d8fe389936a699af5a6c71b"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.18/streamdrop-cli-macos-arm64"
      sha256 "1a2908d691cc831d5858d9503fdc4ac5e76732010b294ee9c075deb446755b23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.18/streamdrop-cli-linux-x64"
      sha256 "3d7c7c718e5a7028b5afc071cbdb2d6be3d8a05f844a741f4ceb0292293f00e1"
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

