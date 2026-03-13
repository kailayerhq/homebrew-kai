class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.9.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "" # TODO: fill after v0.9.4 release
    else
      url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "" # TODO: fill after v0.9.4 release
    end
  end

  on_linux do
    url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "" # TODO: fill after v0.9.4 release
  end

  def install
    # The downloaded file is already gunzipped by Homebrew
    binary = Dir["kai-*"].first || "kai"
    bin.install binary => "kai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kai version")
  end
end
