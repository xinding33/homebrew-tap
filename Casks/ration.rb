cask "ration" do
  version "0.1.0"
  sha256 "f689c0ce5f0ff1e67f21a7e4c43add008b13fe8603672041d1fb47e7a71fd632"

  url "https://github.com/xinding33/ration/releases/download/v#{version}/Ration-#{version}.zip"
  name "Ration"
  desc "Menu bar app that shows Claude and ChatGPT subscription usage"
  homepage "https://github.com/xinding33/ration"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Ration.app"

  uninstall quit: "io.github.xinding33.ration"

  zap trash: [
    "~/Library/Application Support/Ration",
    "~/Library/LaunchAgents/io.github.xinding33.ration.plist",
    "~/Library/Preferences/io.github.xinding33.ration.plist",
  ]
end
