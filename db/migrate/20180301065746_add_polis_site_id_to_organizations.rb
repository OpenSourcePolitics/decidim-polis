class AddPolisSiteIdToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :polis_site_id, :string
  end
end
