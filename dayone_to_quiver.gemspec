# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dayone_to_quiver/version'

Gem::Specification.new do |spec|
  spec.name          = "dayone_to_quiver"
  spec.version       = DayoneToQuiver::VERSION
  spec.authors       = ["masainox"]
  spec.email         = ["masainox@gmail.com"]

  spec.summary       = %q{DayoneToQuiver is converter for Day One classic to Quiver.}
  spec.description   = %q{DayoneToQuiver is converter for Day One classic to Quiver.}
  spec.homepage      = "https://github.com/masainox/dayone_to_quiver"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.14.1"
  spec.add_development_dependency "timecop", "~> 0.9.1"

  spec.add_dependency "thor", "~> 0.19.4"
  spec.add_dependency "dayone_toolbox", "~> 0.1.0"
  spec.add_dependency "quiver_toolbox", "~> 0.1.0"
end
