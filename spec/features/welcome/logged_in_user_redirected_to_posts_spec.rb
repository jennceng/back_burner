require "rails_helper"

feature "a logged in user does not see options to sign up or in on welcome page" do
  scenario "a cook logs in and revisits welcome, does not see options to sign in or sign up" do
    cook = FactoryGirl.create(:cook)
    login_as_cook(cook)
    visit root_path

    expect(page).to_not have_link "Sign Up"
    expect(page).to_not have_link "Log In"
    expect(page).to have_content "Welcome back to Back Burner!"
  end

  scenario "a chef logs in and revisits welcome, does not see options to sign in or sign up" do
    chef = FactoryGirl.create(:chef)
    login_as_chef(chef)
    visit root_path

    expect(page).to_not have_link "Sign Up"
    expect(page).to_not have_link "Log In"
    expect(page).to have_content "Welcome back to Back Burner!"
  end

end
