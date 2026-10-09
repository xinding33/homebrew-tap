cask "backspin" do
  version "1.3.0"
  sha256 "33984d2f10d58ea899a78c3f566f9796d4a30c6e19dedc9f1d7667116d51a76d"

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
