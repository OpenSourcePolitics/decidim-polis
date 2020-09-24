# frozen_string_literal: true

require "spec_helper"

describe "pol.is", type: :system do
  include_context "with a component"

  let(:site_id) { ENV["POLIS_SITE_ID"] }
  let(:organization) { create(:organization, polis_site_id: site_id) }
  let(:user) { create :user, :confirmed, organization: organization }
  let(:manifest_name) { "polis" }
  let(:fixed_slug) { "fixed-test-slug" }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(Decidim::Polis::PolisController).to receive(:page_id).and_return(fixed_slug)
    # rubocop:enable RSpec/AnyInstance
    switch_to_host(organization.host)
    visit_component
  end

  it "displays the pol.is iframe" do
    within ".polis" do
      expect(page).to have_css("iframe")
    end
  end

  it "displays data attributes" do
    expect(page).to have_css(".polis[data-site_id=\"#{site_id}\"]")
    expect(page).to have_css(".polis[data-page_id=\"#{fixed_slug}\"]")
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
