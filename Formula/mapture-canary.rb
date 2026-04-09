class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/c649dd651a22bb6c12509b13ef66d2a4dc4f552a.tar.gz"
  sha256 "b756dd333b4a1b530089b682a21301c708a3e6fb77488456eb5dd8bbd7bff057"
  version "0.0.0-canary.20260409153413.c649dd6"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  conflicts_with "mapture", because: "both formulae install the mapture binary"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260409+sha.c649dd6
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260409+sha.c649dd6", shell_output("#{bin}/mapture --version")
  end
end
