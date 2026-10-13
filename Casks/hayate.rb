cask "hayate" do
  version "0.1.16"
  sha256 "09a8ea665ef43710ba531513b7db219133dfd62f9adc2b193abf90f6a9128937"

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
