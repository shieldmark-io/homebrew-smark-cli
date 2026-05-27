# typed: false
# frozen_string_literal: true

class SmarkCli < Formula
  desc "EU Cyber Resilience Act security assessment scanner for embedded firmware"
  homepage "https://shieldmark.io"
  license "BSL-1.1"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.1/smark-cli-0.7.1-darwin-arm64.tar.gz"
      sha256 "16ac04bdbb00d15f81814a410a6408926cb26c0e431a8a00a9e2d595ae6dbda1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.1/smark-cli-0.7.1-darwin-x64.tar.gz"
      sha256 "5c93f143063602bbffb74190ea61aadefa0396f1336b5d0bc6cedaeaeadcf436"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.1/smark-cli-0.7.1-linux-arm64.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.intel?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.1/smark-cli-0.7.1-linux-x64.tar.gz"
      sha256 "557f183e7ccde36340aecd5c12eb05c1ab5545569a46f6e8b33dbb9485c50151"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"smark-cli"
  end

  def caveats
    <<~EOS
      Quick start:
        smark-cli scan ./your-firmware-project
        smark-cli --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smark-cli --version")
  end
end
