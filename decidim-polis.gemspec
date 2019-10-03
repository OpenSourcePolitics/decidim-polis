# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/polis/version"

Gem::Specification.new do |s|
  s.version = Decidim::Polis.version
  s.authors = ["Armand"]
  s.email = ["fardeauarmand@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-polis"
  s.required_ruby_version = ">= 2.5"

  s.name = "decidim-polis"
  s.summary = "A decidim polis module"
  s.description = "A polis component for decidim's participatory processes."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::Polis.version
  s.add_development_dependency "decidim-dev"
end
