class Swiftbip39 < Formula
  desc "BIP-39 mnemonic generator, validator, and seed derivation CLI"
  homepage "https://github.com/devdasx/swift-bip39-mnemonic"
  url "https://github.com/devdasx/swift-bip39-mnemonic/archive/refs/tags/1.1.4.tar.gz"
  sha256 "6c5e85711627f6d8f9d6c835d7f656c9ea7dc5cff2dfd61e64f45319f46f6860"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    libexec.install ".build/release/swiftbip39"
    libexec.install ".build/release/SwiftBIP39_SwiftBIP39.bundle"

    (bin/"swiftbip39").write <<~EOS
      #!/bin/sh
      exec "#{libexec}/swiftbip39" "$@"
    EOS
  end

  test do
    assert_match "valid",
      shell_output("#{bin}/swiftbip39 validate " \
                   "'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about'")
  end
end
