class Scrollflip < Formula
  desc "Menu bar app that reverses mouse wheel scrolling but keeps the trackpad natural"
  homepage "https://github.com/xinding33/scrollflip"
  url "https://github.com/xinding33/scrollflip/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7030720b50aa762ec2328f1af70221ca65db3d170bc8e069680414099eccd351"
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
      Start ScrollFlip now and at every login:
        brew services start scrollflip

      Then grant it Accessibility access when prompted, and keep Natural scrolling
      on in System Settings. ScrollFlip reverses only the mouse wheel.

      macOS asks for Accessibility permission again after each upgrade. Clear the
      old entry and restart:
        tccutil reset Accessibility io.github.xinding33.scrollflip
        brew services restart scrollflip
    EOS
  end

  service do
    run [opt_prefix/"ScrollFlip.app/Contents/MacOS/ScrollFlip"]
    keep_alive successful_exit: false
    process_type :interactive
  end

  test do
    app = prefix/"ScrollFlip.app"
    assert_predicate app/"Contents/MacOS/ScrollFlip", :executable?
    system "codesign", "--verify", app
  end
end
