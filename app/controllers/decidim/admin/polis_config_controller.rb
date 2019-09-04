module Decidim
  module Admin
    # Controller that allows managing the user organization.
    #
    class PolisConfigController < Decidim::Admin::ApplicationController
      layout "decidim/admin/settings"

      def hello
        enforce_permission_to :update, :organization, organization: current_organization
        render plain: "OK"
      end

      def edit
        enforce_permission_to :update, :organization, organization: current_organization
        @form = form(PolisConfigForm).from_model(current_organization)
        
      end

      def update
        enforce_permission_to :update, :organization, organization: current_organization
        @form = form(PolisConfigForm).from_params(params)

        UpdateOrganizationPolisConfig.call(current_organization, @form) do
          on(:ok) do
            flash[:notice] = I18n.t("organization.update.success", scope: "decidim.admin")
            redirect_to organization_polis_config_edit_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("organization.update.error", scope: "decidim.admin")
            render :edit
          end
        end
      end
    end
  end
end
