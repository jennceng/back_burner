require "rails_helper"

# As an authenticated user
#   I want to delete my account
#   So that my information is no longer retained by the app
#
#     Acceptance Criteria -
#     [ ] On my user page I have the option to delete my account
#     [ ] If I click delete account I am prompted for confirmation
#     [ ] If I click no on the confirmation my account is not deleted
#     [ ] If I click yes on the confirmation my account is deleted and I receive a message of "hope to see you again"
#     [ ] If I delete my account I am redirected to the job post index page and have the option to Sign In / Sign Up, but not Sign Out

feature "authenticated Cook deletes their account" do

  scenario "Cook successfully deletes account" do
    cook = FactoryGirl.create(:cook)

    login_as_cook(cook)
    visit cook_path(cook)

    within(".off-canvas") do
      click_on "Update Account Info"
    end
    click_button "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Log In"
    expect(page).to_not have_content "Update Information"
  end

end
