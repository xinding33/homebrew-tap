cask "loupe" do
  version "0.2.0"
  sha256 "2e9cf9717b3218386e75cd1318f5d83c9ba8d67d938a706e26ce8d2ed3df45c5"

  url "https://github.com/xinding33/loupe/releases/download/v#{version}/Loupe-#{version}.zip"
  name "Loupe"
  desc "Overlay that tells you which Genshin Impact artifacts to keep, level or feed"
  homepage "https://github.com/xinding33/loupe"

  auto_updates true
  depends_on macos: :sonoma

  app "Loupe.app"

  uninstall quit: "io.github.xinding33.loupe"

  zap trash: [
    "~/Library/Application Support/Loupe",
    "~/Library/Preferences/io.github.xinding33.loupe.plist",
    "~/Library/Saved Application State/io.github.xinding33.loupe.savedState",
  ]
end
