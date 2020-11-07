class Sword < Formula
  desc "Cross-platform tools to write Bible software"
  homepage "https://www.crosswire.org/sword/index.jsp"
  url "https://www.crosswire.org/ftpmirror/pub/sword/source/v1.9/sword-1.9.0.tar.gz"
  sha256 "42409cf3de2faf1108523e2c5ac0745d21f9ed2a5c78ed878ee9dcc303426b8a"
  license "GPL-2.0-only"

  livecheck do
    url "https://www.crosswire.org/ftpmirror/pub/sword/source/"
    regex(%r{href=.*?sword[._-]v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  bottle do
    sha256 "3c4fd6972c16470479e43a43ef097a053ed6543b6e3d2cdfb1c15ff7416dbae1" => :catalina
    sha256 "ab228fd2df3f45e696e50224872a2fd80d24fcebc92f2b6ba5ff6e36d8534bc6" => :mojave
    sha256 "3279c77477c21d1636f573202df976bd37fbaca39ed7e3b310158dad4e961641" => :high_sierra
    sha256 "794afe687eb7933fd3aeaee7e480224295614fc0138b8d89b7d9b81be55239a1" => :sierra
    sha256 "032c83b3302b78c198d1e346258a1d09c542a1361e1b0f000f82306d8c82acb4" => :el_capitan
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-profile
      --disable-tests
      --with-curl
      --without-icu
      --without-clucene
    ]

    system "./configure", *args
    system "make", "install"
  end

  test do
    # This will call sword's module manager to list remote sources.
    # It should just demonstrate that the lib was correctly installed
    # and can be used by frontends like installmgr.
    system "#{bin}/installmgr", "-s"
  end
end
