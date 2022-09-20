class AddPolisSiteUrlToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :polis_site_url, :string
  end
end
