class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/483ef0ba715ad7eed531874c7cf5ec0f663a3144.tar.gz"
  sha256 "adc1c6fecd6b02b283175f4878d246057273598525d87aa8d1b0532d824c0696"
  version "0.0.0-canary.2026-04-09175643.483ef0b"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260409+sha.483ef0b
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260409+sha.483ef0b", shell_output("#{bin}/mapture --version")
  end
end
