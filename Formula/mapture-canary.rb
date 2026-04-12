class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/552f30f3306a19b1df778b9332d98d6d5d040065.tar.gz"
  sha256 "3bcbd48e7419669b743b1478e8dde5c6f74c67260eb0f2c4080a56f1bd18a3b2"
  version "0.0.0-canary.2026-04-12175828.552f30f"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260412+sha.552f30f
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260412+sha.552f30f", shell_output("#{bin}/mapture --version")
  end
end
