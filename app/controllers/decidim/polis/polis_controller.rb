# frozen_string_literal: true

module Decidim
  module Polis
    # Exposes the polis resource so users can view them
    class PolisController < Decidim::Polis::ApplicationController
      helper_method :page_id, :site_id

      def show; end

      private

      def site_id
        current_organization.polis_site_id
      end

      def page_id
        return unless params[:participatory_process_slug]

        "#{current_component.id}#{params[:participatory_process_slug]}"
      end
    end
  end
end
