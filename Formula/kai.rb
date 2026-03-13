class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.9.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "862a0d030d75a28ad03413781a72d315a93035666ee6e417659e5dbb76aa037a"
    else
      url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "23ca4239f4a566fbfa2c3799c87e793ecbae40c7427643943abb78cfdd0d35e2"
    end
  end

  on_linux do
    url "https://github.com/kailayerhq/kai/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "bdef260fa81e6763bcf2a880f2895ba0189d55e1e1bd93ceef1acb117f0d2c6b"
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
