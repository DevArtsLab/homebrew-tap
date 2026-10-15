class Saystop < Formula
  desc "Floating stop button for macOS say speech output"
  homepage "https://github.com/DevArtsLab/saystop"
  url "https://github.com/DevArtsLab/saystop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8131e93d90e2f5548d109cae311deea16197c550d07225033b160bed9a23c6cf"
  license "MIT"

  uses_from_macos "swift" => :build

  def install
    system "swiftc", "-O", "-target", "#{Hardware::CPU.arch}-apple-macosx12.0",
           "-o", "saystop", "Sources/saystop/main.swift"
    bin.install "saystop"
  end

  def caveats
    <<~EOS
      To give every `say` call the floating stop button, run:
        saystop --install-shim
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/saystop --version")
  end
end
