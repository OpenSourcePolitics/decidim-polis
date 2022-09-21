# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Inspired from : https://github.com/mainio/decidim-module-simple_proposal/blob/master/Gemfile
base_path = File.basename(__dir__) == "development_app" ? "../" : ""
require_relative "#{base_path}lib/decidim/polis/version"

gem "decidim", Decidim::Polis.decidim_version
gem "decidim-polis", path: "."

gem "bootsnap", "~> 1.4"
gem "puma", ">= 5.3.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri
  gem "rubocop-faker"

  gem "decidim-dev", Decidim::Polis.decidim_version
end

group :development do
  gem "faker", "~> 2.14"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "rack-mini-profiler", require: false
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
