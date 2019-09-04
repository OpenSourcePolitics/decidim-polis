# frozen_string_literal: true

module Decidim
  module Polis
    module PolisHelper
      def avatar_url
        "https://#{current_organization.host}#{current_user.avatar}"
      end
    end
  end
end
