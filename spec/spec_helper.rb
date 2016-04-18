require 'coveralls'
Coveralls.wear!('rails')

RSpec.configure do |config|

  def login(user)
    visit root_path
    fill_in "E-mail", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
