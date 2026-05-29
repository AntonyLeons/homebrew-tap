class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "1.0.16"

  on_macos do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-macos-x64"
      sha256 "ac96c375c622f3e4fe196b2a676be9cc3707fa58fcf3dc005fedfe24e705ab1b"
    end
    on_arm do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-macos-arm64"
      sha256 "6e54c9a0a74ff7eae1101535725cefcbf681f7342063b1fe0bab25491d511f7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v1.0.16/streamdrop-cli-linux-x64"
      sha256 "be0296cc79149d4321a3677c65395401c3925bebd51209a8aa26a1602b0a8dea"
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
