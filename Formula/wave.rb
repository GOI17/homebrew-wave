class Wave < Formula
  desc "Capture, preview, apply, and roll back macOS migration plans"
  homepage "https://github.com/GOI17/wave"
  url "https://github.com/GOI17/wave/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "1386463bf65ba4cde807ac9b479ea2061d13fb70e8c65243b8ac302dc3d6196a"
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
