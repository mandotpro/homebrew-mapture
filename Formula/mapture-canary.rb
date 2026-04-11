class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/1ee1e34a4063895a39abd32a1e11e028b8d699af.tar.gz"
  sha256 "5f0c539e48fcfc78639a9e2d3f5c138528f9f153ed683b4da3012161918a2be2"
  version "0.0.0-canary.2026-04-11070617.1ee1e34"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260411+sha.1ee1e34
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260411+sha.1ee1e34", shell_output("#{bin}/mapture --version")
  end
end
