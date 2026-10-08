class Wink < Formula
  desc "Menu bar app to disconnect and reconnect external displays without unplugging"
  homepage "https://github.com/xinding33/wink"
  url "https://github.com/xinding33/wink/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f3ce74c9e145cca4c30a57617b6cd73d7fd1f7779e3ba12838e196b60f11ce06"
  license "Apache-2.0"

  depends_on macos: :ventura

  def install
    system "bash", "scripts/build.sh"
    prefix.install "dist/Wink.app"
  end

  def caveats
    <<~EOS
      Open Wink once to start it:
        open #{opt_prefix}/Wink.app

      Then choose Open at Login from its menu bar icon to keep displays you turn
      off disconnected after a restart.

      Quit Wink before upgrading, then open it again. Before uninstalling, turn
      off Open at Login and quit Wink from its menu.
    EOS
  end

  test do
    app = prefix/"Wink.app"
    assert_predicate app/"Contents/MacOS/Wink", :executable?
    system "codesign", "--verify", app
  end
end
