class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/5efa02c5bd28089a7f89cb5375b8b617fce3d808.tar.gz"
  sha256 "4c4b91bd8f46d8aa6dea00132b7dd068dc665570956f7ae021cb9db2664886f3"
  version "0.0.0-canary.2026-04-12122131.5efa02c"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260412+sha.5efa02c
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260412+sha.5efa02c", shell_output("#{bin}/mapture --version")
  end
end
