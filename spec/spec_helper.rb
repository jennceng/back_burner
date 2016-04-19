require 'coveralls'
Coveralls.wear!('rails')

RSpec.configure do |config|

  def login_as_chef(chef)
    visit new_chef_session_path
    fill_in "Email", with: chef.email
    fill_in "Password", with: chef.password
    click_on "Log in"
  end

  def login_as_cook(cook)
    visit new_cook_session_path
    fill_in "Email", with: cook.email
    fill_in "Password", with: cook.password
    click_on "Log in"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
