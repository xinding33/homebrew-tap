cask "detour" do
  version "0.1.0"
  sha256 "ba03ee41e790b16a98ccc17bbe06b1dc37169c7b31eac967c837a1e141834d86"

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
