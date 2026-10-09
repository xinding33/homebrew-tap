cask "backspin" do
  version "1.4.0"
  sha256 "a02b9abb24fc3e98ba22a3cd636b8450935ea6161325476d0b2e6af85d97606b"

  url "https://github.com/xinding33/backspin/releases/download/v#{version}/Backspin-#{version}.zip"
  name "Backspin"
  desc "Menu bar app that reverses mouse wheel scrolling but keeps the trackpad natural"
  homepage "https://github.com/xinding33/backspin"

  depends_on macos: :ventura

  app "Backspin.app"

  # brew upgrade reopens it afterwards.
  uninstall quit: "io.github.xinding33.backspin"

  zap trash: [
    "~/Library/LaunchAgents/io.github.xinding33.backspin.plist",
    "~/Library/LaunchAgents/io.github.xinding33.scrollflip.plist",
    "~/Library/Logs/Backspin.log",
    "~/Library/Logs/ScrollFlip.log",
    "~/Library/Preferences/io.github.xinding33.backspin.plist",
    "~/Library/Preferences/io.github.xinding33.scrollflip.plist",
  ]
end
