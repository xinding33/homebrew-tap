cask "wow-session-recorder" do
  version "0.3.0"
  sha256 "b4b9b3652d94e3de9ba77f4507b7536345e41438a76feffe338ad8204c84cbf9"

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
