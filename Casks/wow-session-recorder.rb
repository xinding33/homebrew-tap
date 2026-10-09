cask "wow-session-recorder" do
  version "0.1.0"
  sha256 "5b5e5e7c4f7a1e8d2897ea98d8b7722d5981a8020751bb9e76452c066973f68f"

  url "https://github.com/xinding33/wow-session-recorder/releases/download/v#{version}/WoW-Session-Recorder-#{version}.dmg"
  name "WoW Session Recorder"
  desc "Menu bar app that records World of Warcraft and labels it from the combat log"
  homepage "https://github.com/xinding33/wow-session-recorder"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "WoW Session Recorder.app"

  uninstall launchctl: [
              "io.github.wowsessionrecorder.open-with-wow",
              "io.github.xinding33.wow-session-recorder.open-with-wow",
            ],
            quit:      "io.github.xinding33.wow-session-recorder"

  # Footage and the library stay where you chose to keep them (~/Movies/WoW Session Recorder
  # by default).
  zap trash: [
    "~/Library/Caches/io.github.wowsessionrecorder.SessionRecorder",
    "~/Library/Caches/io.github.xinding33.wow-session-recorder",
    "~/Library/Preferences/io.github.wowsessionrecorder.SessionRecorder.plist",
    "~/Library/Preferences/io.github.xinding33.wow-session-recorder.plist",
  ]
end
