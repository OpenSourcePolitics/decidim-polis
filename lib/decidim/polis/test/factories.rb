# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :polis_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :polis).i18n_name }
    manifest_name { :polis }
    participatory_space { create(:participatory_process, :with_steps) }
  end
end

FactoryBot.modify do
  factory :organization, class: "Decidim::Organization" do
    name { Faker::Company.unique.name }
    reference_prefix { Faker::Name.suffix }
    time_zone { "UTC" }
    twitter_handler { Faker::Hipster.word }
    facebook_handler { Faker::Hipster.word }
    instagram_handler { Faker::Hipster.word }
    youtube_handler { Faker::Hipster.word }
    github_handler { Faker::Hipster.word }
    sequence(:host) { |n| "#{n}.lvh.me" }
    description { Decidim::Faker::Localized.wrapped("<p>", "</p>") { generate_localized_title } }
    favicon { Decidim::Dev.test_file("icon.png", "image/png") }
    default_locale { Decidim.default_locale }
    available_locales { Decidim.available_locales }
    users_registration_mode { :enabled }
    official_img_header { Decidim::Dev.test_file("avatar.jpg", "image/jpeg") }
    official_img_footer { Decidim::Dev.test_file("avatar.jpg", "image/jpeg") }
    official_url { Faker::Internet.url }
    highlighted_content_banner_enabled { false }
    enable_omnipresent_banner { false }
    badges_enabled { true }
    user_groups_enabled { true }
    send_welcome_notification { true }
    admin_terms_of_use_body { Decidim::Faker::Localized.wrapped("<p>", "</p>") { generate_localized_title } }
    force_users_to_authenticate_before_access_organization { false }
    smtp_settings do
      {
        "from" => "test@example.org",
        "user_name" => "test",
        "encrypted_password" => Decidim::AttributeEncryptor.encrypt("demo"),
        "port" => "25",
        "address" => "smtp.example.org"
      }
    end
    polis_site_id { Faker::Hipster.word }

    after(:create) do |organization|
      tos_page = Decidim::StaticPage.find_by(slug: "terms-and-conditions", organization: organization)
      create(:static_page, :tos, organization: organization) if tos_page.nil?
    end
  end
end
