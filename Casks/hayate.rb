cask "hayate" do
  version "0.1.14"
  sha256 "ff21ba95d717db0db1d57867e490a7f0ec9eaca3f37c40db4a73d193e3d2177c"

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
