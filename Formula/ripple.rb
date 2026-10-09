class Ripple < Formula
  desc "Menu bar app that wakes your Macs together for Universal Control"
  homepage "https://github.com/xinding33/ripple"
  url "https://github.com/xinding33/ripple/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5e18a7f887b1545e9a45310e213b0a8eb0b35480d6ab6adbc0cc302638ff3dd3"
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
