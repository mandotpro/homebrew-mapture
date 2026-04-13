class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/c29efd9a1e51c512fc6682cb589b75abe6ed3c31.tar.gz"
  sha256 "379bee5110edb1b6f7076a2a90bb71759b45039be50a86484832651df82d204f"
  version "0.0.0-canary.2026-04-13022045.c29efd9"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260413+sha.c29efd9
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260413+sha.c29efd9", shell_output("#{bin}/mapture --version")
  end
end
