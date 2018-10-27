require "rails_helper"

feature "Search Triggers", js: true do
  scenario "when search is triggered an there are results" do
    visit root_path

    expect(page).to have_content("Meetups In Munich")

    fill_in "query", with: "rails meetup"
    click_on "Search"

    expect(page).to have_content(I18n.t("meetups.search.success.message"))
    sleep 5

    within "#result" do
      expect(page).to have_css(".meetup-card")
      expect(page).to have_css(".details")
    end
  end

  scenario "when search is triggered and there are no results" do
    visit root_path

    expect(page).to have_content("Meetups In Munich")

    fill_in "query", with: "xxx"
    click_on "Search"

    expect(page).to have_content(I18n.t("meetups.search.success.message"))
    sleep 5

    expect(page).to have_content(I18n.t("meetups.polling.results.empty"))
  end
end
