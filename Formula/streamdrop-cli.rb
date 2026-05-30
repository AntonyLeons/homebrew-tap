class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.19"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.19/streamdrop-cli-macos-x64"
      sha256 "4efcb20c7a8837c6f2aa8084d9eb8c9b7bc4c98c4ee2d6a4442c03897f31556e"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.19/streamdrop-cli-macos-arm64"
      sha256 "36af035070bc18f70f065e1cdf6ab0a90331584539508890b52cb7e275d76d5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.19/streamdrop-cli-linux-x64"
      sha256 "91d38fbc81178f5fd8618672a381487b7a6bae3795243d62fc00ad0d895e93af"
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

