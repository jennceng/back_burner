require "rails_helper"

# Feature 12:
#
#   As an authenticated cook user
#   I can respond to a job posting
#   So that I can lock in a job for extra money
#
#     Acceptance Criteria -
#     Happy Path
#     [ ] When I see an open job post I can click to sign up for that job
#     [x] I can see a signal on the job posting that says I have signed up, but am awaiting a decision from the Chef
#
#     Unhappy Path as a authenticated chef
#     [x] I cannot see an option to sign up for a job posting
#
#     Unhappy Path as an unauthenticated user of any kind:
#     [ ] If I am an unauthenticated Chef or Cook, I cannot see the option to sign up for a job posting

feature "an authenticated cook can respond to a job post" do
  let!(:post) { FactoryGirl.create(:post) }
  let!(:cook1) { FactoryGirl.create(:cook) }
  let!(:cook2) { FactoryGirl.create(:cook) }
  let!(:chef) { FactoryGirl.create(:chef) }
  context "an authenticated cook can respond to a job post" do
    before(:each) do
      login_as_cook(cook1)
    end

    scenario "successfully responds to a post" do
      click_on "Sign Up"

      expect(page).to have_content post.chef.full_address
      expect(page).to have_content post.chef.restaurant_name
      expect(page).to have_content post.start_time
      expect(page).to have_content post.end_time
      expect(page).to have_content post.wage
      expect(page).to have_content post.description
      expect(page).to have_content "Job requested! Awaiting Chef's decision"
      expect(page).to have_content "Pending"
    end
  end

  context "an authenticated cook can respond to a job post" do
    scenario "an authenticated chef cannot sign up for a job posting" do
      login_as_chef(chef)
      visit posts_path

      expect(page).to_not have_button "Sign Up"
    end
  end

  context "an unauthenticated user cannot resopnd to a job post" do
    scenario "an unauthenticated user cannot resopnd to a job post" do
      visit posts_path

      expect(page).to_not have_button "Sign Up"
    end
  end

end
