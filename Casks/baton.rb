cask "baton" do
  version "0.1.4"
  sha256 "82386c6f0f0741e4fb202c06c6467dc097afa9ae2208ed064b2f1494bf3e188b"

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
