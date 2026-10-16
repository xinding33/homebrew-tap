cask "ration" do
  version "0.2.0"
  sha256 "7fb2332cd1efbaed5c20c1c078d17c01c2107d3277f88d01c5491433d0e6ca19"

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
