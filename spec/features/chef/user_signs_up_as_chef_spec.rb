require "rails_helper"

# As a prospective head chef
# I want to create an account
# So that I can post a job listing
#
# Acceptance Criteria -
# Happy Path:
# [ ] On the home page under "I am a Chef", there is a link to Sign Up for a new Chef account
# [ ] I must provide a first name, last name, email, phone number, restaurant name, and restaurant address
# [ ] If I've entered valid information, I receive a message that my account has been successfully created
#
# Unhappy Path:
# [ ] If I did not provide valid credentials, for example if my email is already associated with an existing account, I receive an error message as to why my sign up failed, that I have failed to signed up, and I am still at my form that is pre-filled with what I have already tried to fill out

feature "a prospective head chef can sign up for a new Chef account" do
  scenario "prospective Chef successfully creates new account" do
    visit root_path
    within(".chef") do
      click_on("Sign Up")
    end

    fill_in "First Name", with: "Barbara"
    fill_in "Last Name", with: "Lynch"
    fill_in "Restaurant Name", with: "Sportello"
    fill_in "Address", with: "348 Congress Street"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Zip", with: "02210"
    fill_in "E-mail", with: "bamf@lynch.com"
    fill_in "Cell Phone Number", with: "5558675309"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Sign up"


    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "passwords don't match, account not created" do
    visit root_path
    within(".chef") do
      click_on("Sign Up")
    end

    fill_in "First Name", with: "Barbara"
    fill_in "Last Name", with: "Lynch"
    fill_in "Restaurant Name", with: "Sportello"
    fill_in "Address", with: "348 Congress Street"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Zip", with: "02210"
    fill_in "E-mail", with: "bamf@lynch.com"
    fill_in "Cell Phone Number", with: "5558675309"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notpassword"

    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end
