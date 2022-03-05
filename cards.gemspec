# frozen_string_literal: true

require_relative "lib/cards/version"

Gem::Specification.new do |spec|
  spec.name          = "cards"
  spec.version       = Cards::VERSION
  spec.authors       = ["Ceejayski"]
  spec.email         = ["sirchijioke1@gmail.com"]

  spec.summary       = "MagictheGathering API"
  spec.description   = "MagictheGathering API unofficial ruby gem"
  spec.homepage      = "https://github.com/ceejayski/cards-cli"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0" # rubocop:disable Gemspec/RequiredRubyVersion

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
