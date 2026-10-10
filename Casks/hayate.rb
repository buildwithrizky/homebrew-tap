cask "hayate" do
  version "0.1.3"
  sha256 "4e544c321c4eb7b27e087e0dca5bb238623d1bd8bbad463014755198ee9b1292"

  url "https://github.com/buildwithrizky/hayate/releases/download/v#{version}/Hayate_#{version}_aarch64.dmg"
  name "Hayate"
  desc "Local AI Agent Harness"
  homepage "https://github.com/buildwithrizky/hayate"

  depends_on arch: :arm64

  app "Hayate.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Hayate.app"],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Hayate.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.buildwithrizky.hayate",
    "~/Library/Saved Application State/com.buildwithrizky.hayate.savedState",
  ]
end
