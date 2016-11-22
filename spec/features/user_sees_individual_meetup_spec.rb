require 'spec_helper'

feature "User visits /meetups/:id" do
  scenario "sees a list of meetups" do
    meetup1 = FactoryGirl.create(:meetup)
    visit '/meetups'
    click_link meetup1.name

    expect(page).to have_content meetup1.name
    expect(page).to have_content meetup1.location
    expect(page).to have_content meetup1.creator
    expect(page).to have_content meetup1.
  end
end
