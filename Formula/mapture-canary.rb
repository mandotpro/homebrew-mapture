class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/6d265ab72675dde8068b22497540c30a23e04ad9.tar.gz"
  sha256 "9701c4bf101fb258ba0912ae2d44b31e041d14d2218cbb07285d7193aa1742de"
  version "0.0.0-canary.2026-04-11064218.6d265ab"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260411+sha.6d265ab
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260411+sha.6d265ab", shell_output("#{bin}/mapture --version")
  end
end
