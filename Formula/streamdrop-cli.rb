class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.16"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-macos-x64"
      sha256 "1ebbc3f4abc7571bb4bc069caef03e8e39558e36c9ddc578deea766a89c2287d"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-macos-arm64"
      sha256 "3b9708ffa9bb23c41d33654b72ff39c7671d982c634a0d2a37ffcda480935880"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-linux-x64"
      sha256 "4d6bcb726591504fc07a99b2788a5d520d9f32a316436a2c3d1acffc949cd298"
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

