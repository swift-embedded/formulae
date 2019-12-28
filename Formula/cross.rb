class Cross < Formula
  desc "Wrapper around swift-build for simpler building of baremetal apps"
  homepage "https://github.com/swift-embedded/swift-embedded"
  url "https://github.com/swift-embedded/cross.git",
    :tag => 'v0.1.1',
    :revision => "959a99f1194930f689935f92ff7da577e6bdfd52"
  version "0.1.1"
  head "https://github.com/swift-embedded/cross.git"
  depends_on :xcode => ["10.0", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    open("Cross.toml", "w") do |f|
      f.puts 'target = "STM32F439ZI"'
    end
    system "#{bin}/cross"
  end
end
