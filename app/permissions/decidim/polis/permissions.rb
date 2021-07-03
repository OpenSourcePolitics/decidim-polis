# frozen_string_literal: true

module Decidim
  module Polis
    class Permissions < Decidim::DefaultPermissions
      def permissions
        return permission_action unless user

        can_manage? if permission_action.action == :manage && permission_action.subject == :polis

        permission_action
      end

      private

      def can_manage?
        allow! if user.admin? || user.role?("user_manager")
      end
    end
  end
end
