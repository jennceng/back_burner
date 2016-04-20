require "rails_helper"

feature "an authenticated Chef can edit their account information" do
  let!(:chef1) { FactoryGirl.create(:chef, first_name: "Michael") }
  let!(:chef2) { FactoryGirl.create(:chef, first_name: "Gob") }

  scenario "authenticated Chef successfully logs in and sees their posts and only their posts" do
    3.times do
      FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
      FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
    end
    login_as_chef(chef1)

    expect(page).to have_content "Running meat station"
    expect(page).to have_content "Welcome back, #{chef1.first_name}"
    expect(page).to_not have_content "Running pasta station"
  end

  scenario "authenticated Chef cannot access show page of another Chef, redirected to posts page" do
    login_as_chef(chef2)
    visit chef_path(chef1)

    expect(page).to have_content "You cannot access that part of the website"
    expect(page.current_path).to eq posts_path
  end

end
