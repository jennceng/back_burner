require "rails_helper"


  # As an authenticated Chef
  # I can create a new job posting
  # So that I can find a cook to fill a shift
  #
  #   Acceptance Criteria -
  #   Happy Path:
  #   [ ] On the job list index there is a form to post a new job listing
  #   [ ] If I provide a valid date, start time, end time (jobs can't be less than 4 hours), hourly wage, and description about the job including general role and tasks, my job is posted on the index page at the top (by created time)
  #
  #   Unhappy Path as a authenticated Chef:
  #   [ ] If I do not provide valid information, the changes are not saved and I see a message of errors
  #
  #   Unhappy Path as a authenticated Cook:
  #   [ ] As an authenticated Cook, I cannot see the form on the job post index to submit a new job posting
  #
  #   Unhappy Path as an unauthenticated user of any kind:
  #   [ ] If I am an unauthenticated Chef or Cook, I cannot see the form on the job post index to submit a new job posting

feature "an authenticated chef can create a new job post" do
  let!(:chef) { FactoryGirl.create(:chef) }
  context "an authenticated chef can submit a new job post form" do
    before(:each) do
      login_as_chef(chef)
    end

    scenario "successfully creates a new job post" do
      fill_in "Date", with: "August 8, 2016"
      fill_in "Start Time", with: "2:00 pm"
      fill_in "End Time", with: "11:00 pm"
      fill_in "Hourly Wage", with: "$12"
      fill_in "Description", with: "Run the salad station"
      click_on "Create Post"


      expect(page).to have_content "New job post created!"
      expect(page).to have_content(chef.restaurant_name)
      expect(page).to have_content(chef.full_address)
      expect(page).to have_content "August 8, 2016"
      expect(page).to have_content "2:00 pm"
      expect(page).to have_content "11:00 pm"
      expect(page).to have_content "$12"
      expect(page).to have_content "Run the salad station"
    end

    scenario "information provided not valid, job post not created" do
      fill_in "Date", with: "August 8, 2016"
      fill_in "Start Time", with: "2:00 pm"
      fill_in "Hourly Wage", with: "$12"
      fill_in "Description", with: "Run the salad station"
      click_on "Create Post"

      expect(page).to have_content "End time can't be blank"
    end
  end

  pending "an authenticated cook cannot submit a new job post" do
    scenario "authenticated cook cannot submit a new job post" do
      cook = FactoryGirl.create(:cook)
      login_as_cook(cook)

      expect(page).to_not have_button("Create Post")
    end
  end

  context "an unauthenticated user cannot submit a new job post" do
    scenario "unauthenticated user cannot submit a new job post" do
      visit posts_path

      expect(page).to_not have_button("Create Post")
    end
  end

end
