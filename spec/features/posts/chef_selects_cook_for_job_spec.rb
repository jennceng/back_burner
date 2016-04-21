require "rails_helper"

# As an authenticated Chef
# I can see a list of people who responded to the job
# So that I can pick a candidate for fill the shift
#
#   Acceptance Criteria -
#   Happy Path:
#   [ ] When I click on my job post I can see a list of cooks who have responded
#   [ ] I can select a cook for the job
#   [ ] Once I have selected a cook for the job the status of the job post changes to closed and I can see who I have selected for the job
#   [ ] All the responders receive notification of either getting the job or not getting the job
#
#   Unhappy Path as a authenticated Chef:
#   [ ] I cannot see the list of people who responded to a job posted by a different Chef
#   [ ] I cannot see which Cook was picked for the job posting
#
#   Unhappy Path as a authenticated Cook:
#   [ ] As an authenticated Cook, I can see if I've signed up for the job, but I cannot see the other Cooks who have signed up for that job posting
#
#   Unhappy Path as an unauthenticated user of any kind:
#   [ ] If I am an unauthenticated Chef or Cook, I cannot see the list of cook candidates who signed up for a job posting
