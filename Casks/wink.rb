cask "wink" do
  version "1.1.0"
  sha256 "bc52342cd5866fb0950383f93a6525fcf2d6db8ad3bfb42bf1b30a6a93ee58ea"

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
