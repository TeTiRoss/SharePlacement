require 'rails_helper'

feature 'adding placement review' do
  let(:placement) { FactoryGirl.create(:placement) }

  before(:each) do
    login_user
    visit placement_path(placement)
    click_on 'Add review'
  end

  scenario 'successful' do
    fill_in :review_title, with: 'Very good'
    fill_in :review_content, with: 'Clean bathroom'
    attach_file(:review_photos, 'spec/assets/ruby.png')

    click_on 'Add review'

    expect(page).to have_content('Review added')
  end

  context 'unsuccessful' do
    scenario 'with required attributes missing' do
      click_on 'Add review'

      within('.review_title') do
        expect(page).to have_content("can't be blank")
      end
      within('.review_content') do
        expect(page).to have_content("can't be blank")
      end
    end
  end
end
