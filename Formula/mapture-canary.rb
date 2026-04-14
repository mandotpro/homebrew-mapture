class MaptureCanary < Formula
  desc "Repo-native architecture mapping that stays close to the code"
  homepage "https://github.com/mandotpro/mapture.dev"
  url "https://github.com/mandotpro/mapture.dev/archive/8c1d5813e69253e2b9a5c2ac8c9ddfa2083c61c5.tar.gz"
  sha256 "e98f1ae2ebbd59e01521b2f6bdc42e08bbf2e8a234225e1cd824ed908c26bb93"
  version "0.0.0-canary.2026-04-14022022.8c1d581"
  license "MIT"

  livecheck do
    skip "Managed by the Mapture release automation."
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/mandotpro/mapture.dev/src/cmd.version=0.0.0-canary.20260414+sha.8c1d581
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"mapture"), "./src"
  end

  test do
    assert_match "mapture version 0.0.0-canary.20260414+sha.8c1d581", shell_output("#{bin}/mapture --version")
  end
end
