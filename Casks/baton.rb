cask "baton" do
  version "0.1.7"
  sha256 "06b6ad32f871243c762e705464666dec6937bfe4681af7c5eee1833b418890ba"

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
