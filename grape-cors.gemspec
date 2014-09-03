# coding: utf-8

Gem::Specification.new do |spec|

  spec.name          = "grape-cors"
  spec.version       = File.read(File.join(File.dirname(__FILE__),"VERSION")).split("\n")[0].chomp.gsub(' ','')
  spec.authors       = ["Adam Luzsi"]
  spec.email         = ["adamluzsi@gmail.com"]

  spec.description   = %q{ Super easy way to extend Grape with CORS! Just call Grape::CORS.apply after the api classes and you ready to go! }
  spec.summary       = %q{ Super easy way to extend Grape with CORS! }

  spec.homepage      = "https://github.com/adamluzsi/#{__FILE__.split(File::Separator).last.split('.').first}"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "grape"

end
