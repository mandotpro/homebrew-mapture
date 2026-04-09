class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/7dd50174f2ae3337af57c79e48a6f80229ab4060.tar.gz"
  sha256 "af04e5d1eb71a7fc0a98e8209bb7f8841f135e3b39a5f803b5d2659f9de1664e"
  version "0.0.0-canary.2026-04-09155923.7dd5017"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260409+sha.7dd5017
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260409+sha.7dd5017", shell_output("#{bin}/mapture --version")
  end
end
