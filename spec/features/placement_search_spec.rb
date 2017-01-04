require 'rails_helper'

feature 'placement search' do
  let!(:placement_a) { FactoryGirl.create(:placement, title: 'Hotel A') }
  let!(:placement_b) { FactoryGirl.create(:placement, title: 'Hotel B') }

  before(:each) do
    visit root_path

    fill_in :search_title, with: 'A'
    click_on 'Search'
  end

  scenario 'successful' do
    expect(page).to  have_content('Hotel A')
    expect(page).to_not  have_content('Hotel B')
  end

  scenario 'reset' do
    click_on 'Reset'

    expect(page).to  have_content('Hotel A')
    expect(page).to  have_content('Hotel B')
  end
end
