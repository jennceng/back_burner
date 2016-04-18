require "rails_helper"

feature "an unauthenticated user can see a list of job posts" do

  scenario "successfully creates a new job post" do
    post = FactoryGirl.create(:post)
    visit posts_path

    expect(page).to have_content post.chef.restaurant_name
    expect(page).to have_content post.chef.full_address
    expect(page).to have_content post.date
    expect(page).to have_content post.start_time
    expect(page).to have_content post.end_time
    expect(page).to have_content post.wage
    expect(page).to have_content post.description
  end

end
