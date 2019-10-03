# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # Controller that allows managing the user organization.
      #
      class ConfigurationController < Decidim::Polis::Admin::ApplicationController
        layout "decidim/admin/settings"

        def edit
          enforce_permission_to :update, :organization, organization: current_organization
          @form = form(ConfigurationForm).from_model(current_organization)
        end

        def update
          enforce_permission_to :update, :organization, organization: current_organization
          @form = form(ConfigurationForm).from_params(params)

          UpdateConfiguration.call(current_organization, @form) do
            on(:ok) do
              flash[:notice] = I18n.t("organization.update.success", scope: "decidim.admin")
              redirect_to decidim_admin_polis.organization_configuration_edit_path
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
end
