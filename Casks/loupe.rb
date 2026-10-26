cask "loupe" do
  version "0.3.0"
  sha256 "6126da67358a05180e279d348cdf6ab34e4c2a4a17512bbc505722149b68a73c"

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
