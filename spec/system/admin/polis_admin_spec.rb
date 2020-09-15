
# frozen_string_literal: true

require "spec_helper"

describe "manage pol.is", type: :system do
  let(:organization) { create(:organization) }
  let(:user) { create(:user, :admin, :confirmed, organization: organization) }
  let(:site_id) { "my_site_id" }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin.edit_organization_path
    click_link "Settings"
  end

  it "displays pol.is section" do
    expect(page).to have_content("Pol.is")
  end

  it 'should access pol.is configuration' do
    click_link "Pol.is"
    within ".card-title" do
      expect(page).to have_content("POL.IS CONFIGURATION")
    end
  end

  it 'accept pol.is site id' do
    fill_polis_site_id
  end

  context "when site_id is not provided" do
    let(:site_id) { "" }

    it "should update the page" do
      fill_polis_site_id
    end
  end

  private

  def fill_polis_site_id
    click_link "Pol.is"
    within ".card-section" do
      fill_in "Polis site", with: site_id
    end
    click_button "Update"

    expect(page).to have_content "Success"
    expect(page).to have_field("Polis site", with: site_id)
  end
end
