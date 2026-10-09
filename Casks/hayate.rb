cask "hayate" do
  version "0.1.1"
  sha256 "a97fd8b80e47725115e581d1f62ec90311eb75dbe3b570305c5c6b068d63203d"

  url "https://github.com/buildwithrizky/hayate/releases/download/v#{version}/Hayate_#{version}_aarch64.dmg"
  name "Hayate"
  desc "Local AI Agent Harness"
  homepage "https://github.com/buildwithrizky/hayate"

  depends_on arch: :arm64

  app "Hayate.app"

  postflight do
    system_command "xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/Hayate.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.buildwithrizky.hayate",
    "~/Library/Saved Application State/com.buildwithrizky.hayate.savedState",
  ]
end
