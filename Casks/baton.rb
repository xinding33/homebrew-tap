cask "baton" do
  version "0.1.2"
  sha256 "8567adf5c289c2bccacf32f1001aa238ae96c84ee4c5ce58aa95e271abd03041"

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
