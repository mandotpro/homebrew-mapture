class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/1bd35986578ce2b4c117ab0908d0ca0782572e1f.tar.gz"
  sha256 "eecc43aba12ce36d1d0aab2c89068caa8f9a908c3da48e1f2ab963d820cf33c2"
  version "0.0.0-canary.2026-04-12125229.1bd3598"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260412+sha.1bd3598
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260412+sha.1bd3598", shell_output("#{bin}/mapture --version")
  end
end
