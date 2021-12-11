# frozen_string_literal: true

require_relative 'lib/quaker3/version'

Gem::Specification.new do |spec|
  spec.name = 'quaker3'
  spec.version = Quaker3::VERSION
  spec.authors = ['Renan Gigliotti']
  spec.email = ['renan.gigliotti@gmail.com']

  spec.summary = 'A parser for Quake 3 Arena Server log file'
  spec.description = 'A parser the log file of Quake 3 Arena Server returning a list of games and all statistics.'
  spec.homepage = 'https://github.com/renangigliotti/quaker3'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/gems/quaker3'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/renangigliotti/quaker3'
  spec.metadata['changelog_uri'] = 'https://github.com/renangigliotti/quaker3/CHANGELOG.md'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/renangigliotti/quaker3/issues'
  spec.metadata['documentation_uri'] = 'https://rubydoc.info/gems/quaker3'
  spec.metadata['rubygems_mfa_required'] = 'false'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.61'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
