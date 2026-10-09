cask "ripple" do
  version "1.1.0"
  sha256 "e1beb6174ee611ccb0f5251395e75d3da63f8c59d93c9ebc8ba8442f1ac660f0"

  url "https://github.com/xinding33/ripple/releases/download/v#{version}/Ripple-#{version}.zip"
  name "Ripple"
  desc "Menu bar app that wakes your Macs together for Universal Control"
  homepage "https://github.com/xinding33/ripple"

  depends_on macos: :ventura

  app "Ripple.app"

  uninstall quit: "io.github.xinding33.ripple"

  zap trash: [
    "~/Library/LaunchAgents/com.xinding.Ripple.plist",
    "~/Library/LaunchAgents/io.github.xinding33.ripple.plist",
    "~/Library/Preferences/com.xinding.Ripple.plist",
    "~/Library/Preferences/io.github.xinding33.ripple.plist",
  ]
end
