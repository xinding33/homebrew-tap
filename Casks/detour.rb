cask "detour" do
  version "0.1.1"
  sha256 "ff6587b266ee90c06a30291353068e7cf9577621d8e33d1db1eeb20c957b89b1"

  url "https://github.com/xinding33/detour/releases/download/v#{version}/Detour-#{version}.zip"
  name "Detour"
  desc "Turns Tailscale off while chosen apps are open and back on when they quit"
  homepage "https://github.com/xinding33/detour"

  auto_updates true
  depends_on macos: :sonoma

  app "Detour.app"

  uninstall launchctl: "io.github.xinding33.detour",
            quit:      "io.github.xinding33.detour"

  zap trash: [
    "~/Library/Application Support/Detour",
    "~/Library/LaunchAgents/io.github.xinding33.detour.plist",
    "~/Library/Logs/Detour",
    "~/Library/Preferences/io.github.xinding33.detour.plist",
  ]
end
