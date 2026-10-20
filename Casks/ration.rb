cask "ration" do
  version "0.3.2"
  sha256 "8362db60cbc16c18475f85739248bf09a3f10912cba00376b43988014a256adb"

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
