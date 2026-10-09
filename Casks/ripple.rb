cask "ripple" do
  version "1.2.0"
  sha256 "3017e521c1bc54d263ad6b6e1aad3e9a1fc7946b0fc5b7dbdfeccc3b0ab57149"

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
