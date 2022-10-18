# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # A form object used to update the current polis_site_id from the admin
      # dashboard.
      #
      class ConfigurationForm < Form
        include TranslatableAttributes

        mimic :organization

        attribute :polis_site_id, String
        attribute :polis_site_url, String
      end
    end
  end
end
