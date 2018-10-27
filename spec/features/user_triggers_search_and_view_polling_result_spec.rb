require "rails_helper"

feature "Search Triggers", js: true do
  scenario "when search is triggered an there are results" do
    visit root_path

    expect(page).to have_content("Meetups In Munich")

    fill_in "query", with: "rails meetup"
    click_on "Submit"

    expect(page).to have_content("Request is being processed and results will be available shortly")
    sleep 30

    within '#result' do
      expect(page).to have_css('.meetup-card')
      expect(page).to have_css('.details')
    end
  end

  scenario "when search is triggered and there are no results" do
    visit root_path

    expect(page).to have_content("Meetups In Munich")

    fill_in "query", with: "xxx"
    click_on "Submit"

    expect(page).to have_content("Request is being processed and results will be available shortly")
    expect(page).to have_content('No result found.')
  end
end