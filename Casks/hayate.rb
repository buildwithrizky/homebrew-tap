cask "hayate" do
  version "0.1.17"
  sha256 "df5bbe8f00d7e329de4263f322624562a6a952934b1002801aa9a8f2f114fd53"

  url "https://github.com/buildwithrizky/hayate/releases/download/v#{version}/Hayate_#{version}_aarch64.dmg"
  name "Hayate"
  desc "Local AI Agent Harness"
  homepage "https://github.com/buildwithrizky/hayate"

  depends_on arch: :arm64

  app "Hayate.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/Hayate.app"]
    run "/usr/bin/codesign",
        args: ["--force", "--deep", "--sign", "-", "{{appdir}}/Hayate.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.buildwithrizky.hayate",
    "~/Library/Saved Application State/com.buildwithrizky.hayate.savedState",
  ]
end
