class StreamdropCli < Formula
  desc "End-to-end encrypted, zero-storage file transfer CLI"
  homepage "https://streamdrop.app"
  version "${VERSION}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v${VERSION}/streamdrop-cli-macos-x64"
      sha256 "${MAC_INTEL_SHA}"

      def install
        bin.install "streamdrop-cli-macos-x64" => "streamdrop"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v${VERSION}/streamdrop-cli-macos-arm64"
      sha256 "${MAC_ARM_SHA}"

      def install
        bin.install "streamdrop-cli-macos-arm64" => "streamdrop"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/AntonyLeons/streamdrop/releases/download/v${VERSION}/streamdrop-cli-linux-x64"
      sha256 "${LINUX_INTEL_SHA}"

      def install
        bin.install "streamdrop-cli-linux-x64" => "streamdrop"
      end
    end
  end

  test do
    system "#{bin}/streamdrop", "--help"
  end
end