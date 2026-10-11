cask "hayate" do
  version "0.1.7"
  sha256 "f9644ca8b5558327c88e6a0b1bc9ccea54fe03ec1119a1cfe68a96d7862feb98"

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
