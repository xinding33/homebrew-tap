cask "ration" do
  version "0.3.1"
  sha256 "c9367dceee032f7b6e6f9efb936d074321b320281f9a0aaf29c12a7fd235f132"

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
