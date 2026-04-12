class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/bbc774efacfca30fd825144974154ffd6b429b98.tar.gz"
  sha256 "1b64c250d3f0c1c83f55a05b624e1cdee0352111d89a30c7892a20df1df37370"
  version "0.0.0-canary.2026-04-12124704.bbc774e"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260412+sha.bbc774e
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260412+sha.bbc774e", shell_output("#{bin}/mapture --version")
  end
end
