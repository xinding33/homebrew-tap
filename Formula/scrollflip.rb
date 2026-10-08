class Scrollflip < Formula
  desc "Menu bar app that reverses mouse wheel scrolling but keeps the trackpad natural"
  homepage "https://github.com/xinding33/scrollflip"
  url "https://github.com/xinding33/scrollflip/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b4dab1418da6db7a4260d6f030525603b9d0c1383435d7daa4ba226b80113dbd"
  license "Apache-2.0"

  depends_on macos: :ventura

  def install
    app = prefix/"ScrollFlip.app"
    (app/"Contents/MacOS").mkpath
    system "swiftc", "-O", "-swift-version", "5", "-o", app/"Contents/MacOS/ScrollFlip", "ScrollFlip.swift"
    cp "Info.plist", app/"Contents/Info.plist"
    system "codesign", "--force", "--sign", "-", app
  end

  def caveats
    <<~EOS
      Open ScrollFlip once to start it:
        open #{opt_prefix}/ScrollFlip.app

      Grant it Accessibility access when prompted, then choose Start at Login from
      its menu bar icon. Keep Natural scrolling on in System Settings; ScrollFlip
      reverses only the mouse wheel.

      macOS asks for Accessibility permission again after each upgrade. Clear the
      old entry, then choose Restart from ScrollFlip's menu:
        tccutil reset Accessibility io.github.xinding33.scrollflip

      If you started 1.0.0 with `brew services`, stop that service:
        brew services stop scrollflip
    EOS
  end

  test do
    app = prefix/"ScrollFlip.app"
    assert_predicate app/"Contents/MacOS/ScrollFlip", :executable?
    system "codesign", "--verify", app
  end
end
