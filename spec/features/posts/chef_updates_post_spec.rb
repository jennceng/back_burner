require "rails_helper"

# As an authenticated Chef
# I can update the details of a job posting
# So that I can correct errors or provide new information
#
#   Acceptance Criteria -
#   Happy Path:
#   [ ] I am able to see an update option on my own posts, but not the job posts by other head chefs
#   [ ] If a job is still in the 'open' state, I can update details about the job
#   [ ] If I provide valid information for the update, the changes are saved and I see a message of success
#   [ ] If I update my job posting, an email notifying changes have been made are sent out to anyone who has already responded to the posting
#
#   Unhappy Path as a authenticated Chef:
#   [ ] If I do not provide valid information, the changes are not saved and I see a message of errors
#
#   Unhappy Path as a authenticated Cook:
#   [ ] As an authenticated Cook, I cannot see the form on the job post index to submit a new job posting
#
#   Unhappy Path as an unauthenticated user of any kind:
#   [ ] If I am an unauthenticated Chef or Cook, I cannot see the form on the job post index to submit a new job posting

feature "an authenticated chef can update" do
  let!(:chef1) { FactoryGirl.create(:chef) }
  let!(:chef2) { FactoryGirl.create(:chef) }
  let!(:post) { FactoryGirl.create(:post, chef: chef1) }
  context "an authenticated chef can submit a new job post form" do
    before(:each) do
      login(chef1)
    end

    scenario "successfully updates a job post" do
      click_on "Update Post"
      fill_in "Hourly Wage", with: "$20"
      click_on "Update Post"

      expect(page).to have_content "Job post successfully updated!"
      expect(page).to have_content(chef1.restaurant_name)
      expect(page).to have_content(chef1.full_address)
      expect(page).to have_content "$20"
    end

    scenario "information provided not valid, job post not updated" do
      click_on "Update Post"
      fill_in "Start Time", with: ""
      click_on "Update Post"

      expect(page).to have_content "Start time can't be blank"
    end
  end

  context "an authenticated cook cannot update a job post" do
    scenario "authenticated cook cannot submit a new job post" do
      cook = FactoryGirl.create(:cook)
      login(cook)

      expect(page).to_not have_button("Update Post")
    end
  end

  context "an authenticated Chef cannot update a job post of another Chef" do
    scenario "authenticated cook cannot submit a new job post" do
      login(chef2)

      expect(page).to_not have_button("Update Post")
    end
  end

  context "an unauthenticated user cannot submit a new job post" do
    scenario "unauthenticated user cannot submit a new job post" do
      visit posts_path

      expect(page).to_not have_button("Update Post")
    end
  end

end
