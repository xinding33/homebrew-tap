cask "baton" do
  version "0.1.3"
  sha256 "7ec42b18fa39413114f09b6ca9f320961fcb654e402eb7d23bc7e4c18f04f6bf"

  url "https://github.com/xinding33/baton/releases/download/v#{version}/Baton-#{version}.zip"
  name "Baton"
  desc "Shares one mouse and keyboard across several Macs"
  homepage "https://github.com/xinding33/baton"

  auto_updates true
  depends_on macos: :sonoma

  app "Baton.app"

  uninstall launchctl: "com.xinding.baton",
            quit:      "com.xinding.baton"

  zap trash: [
    "~/Library/Application Support/Baton",
    "~/Library/LaunchAgents/com.xinding.baton.plist",
    "~/Library/Logs/Baton",
  ]
end
