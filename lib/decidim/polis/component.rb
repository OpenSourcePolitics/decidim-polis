# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_component(:polis) do |component|
  component.engine = Decidim::Polis::Engine
  component.admin_engine = Decidim::Polis::AdminEngine
  component.icon = "decidim/polis/icon.svg"
  component.stylesheet = "decidim/polis/polis"

  component.settings(:global) do |settings|
    settings.attribute :title, type: :text, translated: true
    settings.attribute :description, type: :text, editor: true, translated: true
    settings.attribute :sign_in_social, type: :boolean, default: false
    settings.attribute :visualization, type: :boolean, default: false
  end

  component.settings(:step) do |settings|
    settings.attribute :user_can_write, type: :boolean, default: false
    settings.attribute :user_can_vote, type: :boolean, default: false
  end
end
