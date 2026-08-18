class Wave < Formula
  desc "Capture and preview macOS device migration plans"
  homepage "https://github.com/GOI17/wave"
  url "https://github.com/GOI17/wave/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "0f5e807db0bbb684a5c0fbccd2e8b5f9537b113ed2a415a1c7ba0d70fc9f1c60"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-s -w -X wave/ui/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/wave"
  end

  test do
    assert_match "Wave v#{version}", shell_output("#{bin}/wave version")
    assert_match "Capture device state", shell_output("#{bin}/wave capture --help")
  end
end
