class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/83bc8a546051040c6e321d3b618d8203521aba75.tar.gz"
  sha256 "c71747160be84b2c4f8c54d1231f94666430dd6e4f8948bc3c9dca0b0186a916"
  version "0.0.0-canary.2026-04-15022035.83bc8a5"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260415+sha.83bc8a5
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260415+sha.83bc8a5", shell_output("#{bin}/mapture --version")
  end
end
