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
#     [ ] I can see a signal on the job posting that says I have signed up, but am awaiting a decision from the Chef
#
#     Unhappy Path as a authenticated chef
#     [ ] I cannot see an option to sign up for a job posting
#
#     Unhappy Path as an unauthenticated user of any kind:
#     [ ] If I am an unauthenticated Chef or Cook, I cannot see the option to sign up for a job posting

feature "an authenticated cook can respond to a job post" do
  let!(:post) { FactoryGirl.create(:post) }
  let!(:cook1) { FactoryGirl.create(:cook) }
  let!(:cook2) { FactoryGirl.create(:cook) }
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

    # scenario "information provided not valid, job post not created" do
    #   fill_in "Date", with: "August 8, 2016"
    #   fill_in "Start Time", with: "2:00 pm"
    #   fill_in "Hourly Wage", with: "$12"
    #   fill_in "Description", with: "Run the salad station"
    #   click_on "Create Post"
    #
    #   expect(page).to have_content "End time can't be blank"
    # end
  end

  # context "an authenticated cook cannot submit a new job post" do
  #   scenario "authenticated cook cannot submit a new job post" do
  #     cook = FactoryGirl.create(:cook)
  #     login_as_cook(cook)
  #
  #     expect(page).to_not have_button("Create Post")
  #   end
  # end
  #
  # context "an unauthenticated user cannot submit a new job post" do
  #   scenario "unauthenticated user cannot submit a new job post" do
  #     visit posts_path
  #
  #     expect(page).to_not have_button("Create Post")
  #   end
  # end

end
