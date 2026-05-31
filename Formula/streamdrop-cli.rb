class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.20"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.20/streamdrop-cli-macos-x64"
      sha256 "5caefd8dbf6220f17baf53e9d3840f0462bef97b72539fc1b12e7dd773a364e2"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.20/streamdrop-cli-macos-arm64"
      sha256 "243439ed73a351b26895eef9ffca308289af0d07033f86758d5cccefbe6953d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.20/streamdrop-cli-linux-x64"
      sha256 "b822d2165e3d44611270c62f3b6ae00a8f2de013b4247e4a47446f7b44b0de14"
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

