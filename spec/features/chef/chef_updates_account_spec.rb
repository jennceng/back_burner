require "rails_helper"

# As an authenticated user
# I want to update my information
# So that I can keep my information up to date
#
#   Acceptance Criteria -
#   Happy Path:
#   [ ] If I click 'edit information' I am brought to a page with my information with an edit option next to each detail I had at sign up or last edit
#   [ ] If I click submit an edit my page reflects those new edits and I receive a success message
#   [ ] If I edit my email or phone number I must verify the new information
#   Unhappy Path:
#   [ ] If I did not provide valid credentials, I receive an error message as to why, and changes were not saved

feature "an authenticated Chef can edit their account information" do
  let!(:chef) { FactoryGirl.create(:chef) }

  scenario "authenticated Chef successfully edits their account information" do
    login_as_chef(chef)
    within(".off-canvas") do
      click_on "Update Account Info"
    end

    fill_in "First Name", with: "JLaw"
    fill_in "Current password", with: chef.password
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "authenticated Chef successfully edits their account information" do
    login_as_chef(chef)
    within(".off-canvas") do
      click_on "Update Account Info"
    end

    fill_in "Password", with: "a"
    fill_in "Password confirmation", with: "a"
    fill_in "Current password", with: chef.password
    click_on "Update"

    expect(page).to have_content "Password is too short (minimum is 8 characters)"
  end

end
