cask "loupe" do
  version "0.5.0"
  sha256 "8dad2a0444102420659ab44e5f7ae980f0017adde1a693c7e5c8691f41925ad9"

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
