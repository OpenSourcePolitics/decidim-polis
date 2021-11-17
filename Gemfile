# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", "0.23.6"
gem "decidim-polis", path: "."

gem "puma", "~> 4.3"
gem "uglifier", "~> 4.1"

gem "bootsnap"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", "0.23.6"
end

group :development do
  gem "faker", "~> 1.9"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
  gem "rack-mini-profiler", require: false
end
