module Decidim
  module Admin
    # Controller that allows managing the user organization.
    #
    class PolisConfigController < Decidim::Admin::ApplicationController
      layout "decidim/admin/settings"

      def hello
        authorize! :update, current_organization
        render plain: "OK"
      end

      def edit
        authorize! :update, current_organization
        @form = form(OrganizationAppearanceForm).from_model(current_organization)
      end

      def update
        authorize! :update, current_organization
      end
    end
  end
end
