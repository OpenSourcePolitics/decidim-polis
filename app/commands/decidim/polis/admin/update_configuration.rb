# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # A command with all the business logic for updating the current
      # organization.
      class UpdateConfiguration < Rectify::Command
        # Public: Initializes the command.
        #
        # organization - The Organization that will be updated.
        # form - A form object with the params.
        def initialize(organization, form)
          @organization = organization
          @form = form
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?
          return broadcast(:ok, @organization) if update_organization

          broadcast(:invalid)
        end

        private

        attr_reader :form, :organization

        def update_organization
          @organization.assign_attributes(attributes)
          @organization.save! if @organization.valid?
        end

        def attributes
          {
            polis_site_id: form.polis_site_id
          }
        end
      end
    end
  end
end
