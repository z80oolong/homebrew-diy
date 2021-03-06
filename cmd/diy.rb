require "formula"
require "cli/parser"

module Homebrew
  module_function

  def diy_args
    Homebrew::CLI::Parser.new do
      usage_banner <<~EOS
        `diy` [<options>]

        Automatically determine the installation prefix for non-Homebrew software.
        Using the output from this command, you can install your own software into
        the Cellar and then link it into Homebrew's prefix with `brew link`.
      EOS
      flag   "--name=",
             description: "Explicitly set the <name> of the package being installed."
      flag   "--version=",
             description: "Explicitly set the <version> of the package being installed."

      switch "-m", "--cmakelists",
             description: "Force output `-DCMAKE_INSTALL_PREFIX=<path>` option."
      switch "-c", "--configure",
             description: "Force output `--prefix=<path>` option."
      switch "-M", "--meson",
             description: "Force output `-Dprefix=<path>` option."
      switch "-o", "--manually",
             description: "Force output `<path>` for putting files into <path> manually."

      named_args max: 0
    end
  end

  def diy
    args = diy_args.parse

    path = Pathname.getwd

    version = args.version || detect_version(path)
    name = args.name || detect_name(path, version)

    prefix = HOMEBREW_CELLAR/name/version

    if args.cmakelists? || File.file?("CMakeLists.txt")
      puts "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    elsif args.configure? || File.file?("configure")
      puts "--prefix=#{prefix}"
    elsif args.meson? || File.file?("meson.build")
      puts "-Dprefix=#{prefix}"
    elsif args.manually?
      puts prefix.to_s
    else
      raise "Couldn't determine build system. You can manually put files into #{prefix}"
    end
  end

  def detect_version(path)
    version = path.version.to_s
    raise "Couldn't determine version, set it with --version=<version>" if version.empty?

    version
  end

  def detect_name(path, version)
    basename = path.basename.to_s
    detected_name = basename[/(.*?)-?#{Regexp.escape(version)}/, 1] || basename
    detected_name.downcase!

    canonical_name = Formulary.canonical_name(detected_name)

    odie <<~EOS if detected_name != canonical_name
      The detected name #{detected_name.inspect} exists in Homebrew as an alias
      of #{canonical_name.inspect}. Consider using the canonical name instead:
        brew diy --name=#{canonical_name}

      To continue using the detected name, pass it explicitly:
        brew diy --name=#{detected_name}
    EOS

    detected_name
  end
end
