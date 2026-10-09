cask "wink" do
  version "1.2.0"
  sha256 "89628e1df0fa44684bf54e9af85b205feff93291b6f336cc6ad5c5e05fc05d80"

  url "https://github.com/xinding33/wink/releases/download/v#{version}/Wink-#{version}.zip"
  name "Wink"
  desc "Menu bar app to disconnect and reconnect external displays without unplugging"
  homepage "https://github.com/xinding33/wink"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Wink.app"

  # Quitting reconnects displays. Wink turns remembered ones off again when it next opens.
  uninstall quit: "io.github.xinding33.wink"

  zap trash: [
    "~/Library/Application Support/Display Switch",
    "~/Library/Application Support/Wink",
    "~/Library/LaunchAgents/io.github.xinding33.wink.plist",
  ]
end
