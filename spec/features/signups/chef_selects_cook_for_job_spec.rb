require "rails_helper"

# As an authenticated Chef
# I can see a list of people who responded to the job
# So that I can pick a candidate for fill the shift
#
#   Acceptance Criteria -
#   Happy Path:
#   [x] When I click on my job post I can see a list of cooks who have responded
#   [ ] I can select a cook for the job
#   [ ] Once I have selected a cook for the job the status of the job post changes to closed and I can see who I have selected for the job
#   [ ] All the responders receive notification of either getting the job or not getting the job
#
#   Unhappy Path as a authenticated Chef:
#   [x] I cannot see the list of people who responded to a job posted by a different Chef
#   [ ] I cannot see which Cook was picked for the job posting
#
#   Unhappy Path as a authenticated Cook:
#   [ ] As an authenticated Cook, I can see if I've signed up for the job, but I cannot see the other Cooks who have signed up for that job posting
#
#   Unhappy Path as an unauthenticated user of any kind:
#   [ ] If I am an unauthenticated Chef or Cook, I cannot see the list of cook candidates who signed up for a job posting

feature "an authenticated Chef can edit their account information" do
  let!(:chef1) { FactoryGirl.create(:chef) }
  let!(:chef2) { FactoryGirl.create(:chef) }
  let!(:cook1) { FactoryGirl.create(:cook, first_name: "Lindsay") }
  let!(:cook2) { FactoryGirl.create(:cook, first_name: "Lucille") }
  let!(:cook3) { FactoryGirl.create(:cook, first_name: "Buster") }

  scenario "authenticated Chef successfully logs in and sees their posts and only their posts" do
    post1 = FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
    post2 = FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
    Signup.create(cook: cook1, post: post1)
    Signup.create(cook: cook2, post: post2)

    login_as_chef(chef1)

    expect(page).to have_content cook1.first_name
    expect(page).to_not have_content cook2.first_name
    expect(page).to have_button "Accept"
    expect(page).to have_button "Reject"
  end

  scenario "authenticated Chef successfully logs in and rejects a cook's signup" do
    post1 = FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
    post2 = FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
    Signup.create(cook: cook1, post: post1)
    Signup.create(cook: cook2, post: post2)

    login_as_chef(chef1)
    click_on "Reject"

    expect(page).to have_content "Rejected"
    expect(page).to_not have_button "Accept"
    expect(page).to_not have_button "Reject"
  end

  scenario "authenticated Chef successfully logs in and accepts a cooks signup" do
    post1 = FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
    post2 = FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
    Signup.create(cook: cook1, post: post1)
    Signup.create(cook: cook2, post: post1)

    login_as_chef(chef1)
    within("##{cook1.id}") do
      click_on("Accept")
    end

    expect(page).to have_content "Cook selected! Job post now closed"
    expect(page).to_not have_button "Accept"
    expect(page).to_not have_button "Reject"
  end

  scenario "Chef rejects a cook, authenticated cook successfully logs in and sees they have been rejected and cannot see other cooks who have signed up" do
    post1 = FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
    post2 = FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
    Signup.create(cook: cook1, post: post1, decision: "Rejected")
    Signup.create(cook: cook2, post: post1, decision: "Accepted")

    login_as_cook(cook1)
    click_on "My Page"

    expect(page).to have_content "Rejected"
    expect(page).to_not have_content cook2.first_name
  end

  # scenario "authenticated Chef successfully logs in and sees their posts and only their posts" do
  #   post1 = FactoryGirl.create(:post, chef: chef1, description: "Running meat station")
  #   post2 = FactoryGirl.create(:post, chef: chef2, description: "Running pasta station")
  #   Signup.create(cook: cook1, post: post1)
  #   Signup.create(cook: cook2, post: post2)
  #
  #   login_as_chef(chef1)
  #
  #   expect(page).to have_content cook1.first_name
  #   expect(page).to_not have_content cook2.first_name
  # end

end
