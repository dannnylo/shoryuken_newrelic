# frozen_string_literal: true

require_relative "lib/shoryuken_newrelic/version"

Gem::Specification.new do |spec|
  spec.name          = "shoryuken_newrelic"
  spec.version       = ShoryukenNewrelic::VERSION
  spec.authors       = ["Danilo Jeremias da Silva"]
  spec.email         = ["daniloj.dasilva@gmail.com"]

  spec.summary       = "Newrelic instrumentation to Shoryuken"
  spec.description   = "Newrelic instrumentation to Shoryuken"
  spec.homepage      = "https://github.com/dannnylo/shoryuken_newrelic"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "newrelic_rpm", ">= 0.0"
  spec.add_dependency "shoryuken", ">= 0.0"

  spec.add_development_dependency "aws-sdk-sqs", ">= 0.0"
  spec.add_development_dependency "rubocop-rake", ">= 0.0"
  spec.add_development_dependency "rubocop-rspec", ">= 0.0"
end
