class Saystop < Formula
  desc "Floating stop/pause panel for macOS say speech output"
  homepage "https://github.com/DevArtsLab/saystop"
  url "https://github.com/DevArtsLab/saystop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7500da6551f533fc9a4912a0403010218519596b5a83bf8e71755f2d52e5f232"
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
