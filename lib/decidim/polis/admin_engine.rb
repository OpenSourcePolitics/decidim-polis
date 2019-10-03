# frozen_string_literal: true

module Decidim
  module Polis
    # This is the engine that runs on the public interface of `polis`.
    # It mostly handles rendering the created projects associated to a participatory
    # process.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Polis::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        get "/organization/configuration/edit" => "configuration#edit"
        put "/organization/configuration/update" => "configuration#update"

        resources :polis do
          resources :attachments
        end

        root to: redirect("../edit")
      end

      initializer "decidim_polis.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::Polis::AdminEngine, at: "/admin", as: "decidim_admin_polis"
        end
      end

      def load_seed
        nil
      end
    end
  end
end
