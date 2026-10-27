cask "loupe" do
  version "0.4.0"
  sha256 "e6b2ded79fc65f99202dfc03afbeb529284cf2af34557e969c7567633974e0a8"

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
