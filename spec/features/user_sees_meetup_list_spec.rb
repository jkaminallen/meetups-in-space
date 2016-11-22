require 'spec_helper'

feature "User visits /meetups" do
  scenario "sees a list of meetups" do
    meetup1 = FactoryGirl.create(:meetup)
    meetup2 = FactoryGirl.create(:meetup, name: "Ruby Parade")
    visit '/meetups'

    expect(page).to have_content("Funny TV Day")
    expect(page).to have_content("Ruby Parade")
  end
end
