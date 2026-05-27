# typed: false
# frozen_string_literal: true

class SmarkCli < Formula
  desc "EU Cyber Resilience Act security assessment scanner for embedded firmware"
  homepage "https://shieldmark.io"
  license "BSL-1.1"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.0/smark-cli-0.7.0-darwin-arm64.tar.gz"
      sha256 "c571ff23c11f65183c84d77fadeb708e50aa424666f31800574ea514be122031"
    end
    if Hardware::CPU.intel?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.0/smark-cli-0.7.0-darwin-x64.tar.gz"
      sha256 "d0161ace98208a08a7d5b0eff20e004548cb05cc2c8a7cee5b4e03a0cfedbc81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.0/smark-cli-0.7.0-linux-arm64.tar.gz"
      sha256 "baf2b6f510f1413d5df4fcd360c6d6b2c4fe291067252698781bba849717ce37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/shieldmark-io/homebrew-smark-cli/releases/download/v0.7.0/smark-cli-0.7.0-linux-x64.tar.gz"
      sha256 "6883e41779cad37c42a734586af09cf46e68dc1ab0cf96ce8a784a641e9677d1"
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
