class Wave < Formula
  desc "Capture, preview, apply, and roll back macOS migration plans"
  homepage "https://github.com/GOI17/wave"
  url "https://github.com/GOI17/wave/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "9265057235336964f655282c8e8450bf7c276a48e2984ce3256fea1109f12510"
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
