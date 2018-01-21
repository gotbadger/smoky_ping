
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smoky_ping/version'

Gem::Specification.new do |spec|
  spec.name        = 'smoky_ping'
  spec.version     = SmokyPing::VERSION
  spec.authors     = ['Philip Hayton']
  spec.email       = ['p.j.hayton@hotmail.com']

  spec.summary     = 'smokeping clone'
  spec.description = 'smokeping clone in ruby using fping, influxdb and grafana'
  spec.homepage    = 'https://github.com/gotbadger/smoky_ping'
  spec.license     = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'influxdb', '~> 0.5.3'
  spec.add_runtime_dependency 'net-fping', '~> 0.3.1'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
