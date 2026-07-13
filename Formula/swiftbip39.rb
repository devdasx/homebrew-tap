class Swiftbip39 < Formula
  desc "BIP-39 mnemonic generator, validator, and seed derivation CLI"
  homepage "https://github.com/devdasx/swift-bip39-mnemonic"
  url "https://github.com/devdasx/swift-bip39-mnemonic/archive/refs/tags/1.1.1.tar.gz"
  sha256 "58bec78944166896ebb12003e64ec1a8b20a48b12042f31871c7b1fc13dace54"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/swiftbip39"
  end

  test do
    assert_match "valid", shell_output("#{bin}/swiftbip39 validate 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about'")
  end
end
