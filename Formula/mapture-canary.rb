class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/701f83fcb0fd5e8ecc4ac6a03b25425606ce4f81.tar.gz"
  sha256 "bc5e19294b8ddc1a4a529a4aa0aace51ff4bb744bdd2146e5f171b8801c3ec38"
  version "0.0.0-canary.2026-04-09173728.701f83f"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260409+sha.701f83f
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260409+sha.701f83f", shell_output("#{bin}/mapture --version")
  end
end
