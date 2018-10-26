require "rails_helper"

feature "Trigger Search" do
  scenario "when a user triggers search " do
    visit "/"
    fill_in "query", with: "rails meetup"
    click_button "Submit"

    expect(page).to have_content("Request is being processed and results will be available shortly")
  end
end

# feature "trigger search completion" do
#   scenario "it checks for results" do
#     visit "/polling"
#     expect(page).to have_content("Loading......")
#   end
# end