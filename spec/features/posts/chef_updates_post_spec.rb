require "rails_helper"

# As an authenticated Chef
# I can update the details of a job posting
# So that I can correct errors or provide new information
#
#   Acceptance Criteria -
#   Happy Path:
#   [ ] I am able to see an update option on my own posts, but not the job posts by other head chefs
#   [ ] If a job is still in the 'open' state, I can update details about the job
#   [ ] If I provide valid information for the update, the changes are saved and I see a message of success
#   [ ] If I update my job posting, an email notifying changes have been made are sent out to anyone who has already responded to the posting
#
#   Unhappy Path as a authenticated Chef:
#   [ ] If I do not provide valid information, the changes are not saved and I see a message of errors
#
#   Unhappy Path as a authenticated Cook:
#   [ ] As an authenticated Cook, I cannot see the form on the job post index to submit a new job posting
#
#   Unhappy Path as an unauthenticated user of any kind:
#   [ ] If I am an unauthenticated Chef or Cook, I cannot see the form on the job post index to submit a new job posting
