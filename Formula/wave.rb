class Wave < Formula
  desc "Capture and preview macOS device migration plans"
  homepage "https://github.com/GOI17/wave"
  url "https://github.com/GOI17/wave/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "d2e82ffd9fcdb7ea3b315f38ebb314570fc16ae80a44b827096375b646e03590"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-X wave/ui/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/wave"
  end

  test do
    assert_match "Wave v#{version}", shell_output("#{bin}/wave version")
    assert_match "Analyze and export current device configuration", shell_output("#{bin}/wave capture --help")
  end
end
