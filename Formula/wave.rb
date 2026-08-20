class Wave < Formula
  desc "Capture, preview, apply, and roll back macOS migration plans"
  homepage "https://github.com/GOI17/wave"
  url "https://github.com/GOI17/wave/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "5b0794b44691fe74a3cfa96bf3179b3c0cf484182741650f2996d5bbed59a411"
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
