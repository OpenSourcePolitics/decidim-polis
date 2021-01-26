# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Polis
    # This is the engine that runs on the public interface of polis.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Polis

      routes do
        resources :polis, only: [:show]
        root to: "polis#show"
      end

      initializer "decidim_polis.assets" do |app|
        app.config.assets.precompile += %w(decidim_polis_manifest.js decidim_polis_manifest.css *.svg)
      end
    end
  end
end
