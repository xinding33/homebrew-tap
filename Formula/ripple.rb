class Ripple < Formula
  desc "Menu bar app that wakes your Macs together for Universal Control"
  homepage "https://github.com/xinding33/ripple"
  url "https://github.com/xinding33/ripple/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2b2eeed7327536993613be4097f0b475258eb7bafb15d53379782d8c54580c7f"
  license "Apache-2.0"

  depends_on macos: :ventura

  def install
    system "bash", "scripts/build.sh"
    prefix.install "dist/Ripple.app"
  end

  def caveats
    <<~EOS
      Install Ripple on each Mac that should wake together, then open it:
        open #{opt_prefix}/Ripple.app

      Allow local network access when prompted. Generate a pairing code in
      Settings on one Mac and enter the same code on the others, then choose
      Open at Login from its menu bar icon.

      Quit Ripple before upgrading, then open it again. Before uninstalling,
      turn off Open at Login and quit Ripple from its menu.
    EOS
  end

  test do
    app = prefix/"Ripple.app"
    assert_predicate app/"Contents/MacOS/Ripple", :executable?
    system "codesign", "--verify", app
  end
end
