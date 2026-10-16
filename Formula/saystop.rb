class Saystop < Formula
  desc "Floating stop/pause panel for macOS say speech output"
  homepage "https://github.com/DevArtsLab/saystop"
  url "https://github.com/DevArtsLab/saystop/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "970f54d3c9bb0b029097bc230385a1048201e1bc8d19fd93b83641c6d17612e2"
  license "MIT"

  uses_from_macos "swift" => :build

  def install
    system "swiftc", "-O", "-target", "#{Hardware::CPU.arch}-apple-macosx12.0",
           "-o", "saystop", "Sources/saystop/main.swift"
    bin.install "saystop"
  end

  def caveats
    <<~EOS
      To give every `say` call the floating stop/pause panel, run:
        saystop --install-shim
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/saystop --version")
  end
end
