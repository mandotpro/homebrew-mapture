class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/097f8ec275dea3e15ea80e8b61f6a82a82ec2e73.tar.gz"
  sha256 "f92300632c3cb0597d935116c9c7c0dbc9db4e7815b2285ac3d501060336e46f"
  version "0.0.0-canary.2026-04-09192802.097f8ec"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260409+sha.097f8ec
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260409+sha.097f8ec", shell_output("#{bin}/mapture --version")
  end
end
