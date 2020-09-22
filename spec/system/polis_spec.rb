# frozen_string_literal: true

require "spec_helper"

describe "pol.is", type: :system do
  include_context "with a component"

  let(:site_id) { "${{ secrets.POLIS_SITE_ID }}" } # to store in local
  let(:organization) { create(:organization, polis_site_id: site_id) }
  let(:user) { create :user, :confirmed, organization: organization }
  # let(:step) { participatory_process.steps.first }
  let(:manifest_name) { "polis" }

  before do
    switch_to_host(organization.host)
    visit_component
  end

  it "alwayses display the pol.is iframe" do
    within ".polis" do
      expect(page).to have_css("iframe")
    end
  end

  context "when user isn't logged in" do
    it "encourages to log in" do
      expect(page).to have_content("Login with your account")
    end
  end

  context "when user is logged in" do
    before do
      login_as user, scope: :user
      visit_component
    end

    it "does not display comments and participants" do
      expect(page).not_to have_content("Comments")
      expect(page).not_to have_content("Participants")
    end
  end

  context "when user can manage decidim" do
    let(:user) { create :user, :admin, :confirmed, organization: organization }

    before do
      login_as user, scope: :user
      visit_component
    end

    it "displays the admin section" do
      expect(page).to have_content("Admin Pol.is")
      expect(page).to have_content("Comments")
      expect(page).to have_content("Participants")
    end
  end
end
