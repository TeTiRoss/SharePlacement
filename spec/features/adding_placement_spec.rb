require 'rails_helper'

feature 'adding placement' do
  before(:each) do
    login_user
    visit root_path
    click_on 'Add placement'
  end

  scenario 'successful' do
    fill_in :placement_title, with: 'Hilton'
    fill_in :placement_address, with: 'Hilton, NY'
    fill_in :placement_description, with: 'Hilton hotel in New York city'
    attach_file(:placement_photos, 'spec/assets/ruby.png')
    fill_in :placement_price, with: 200

    within('.simple_form') do
      click_on 'Add placement'
    end

    expect(page).to have_content('Placement added')
  end


  context 'unsuccessful' do
    scenario 'with required attributes missing' do
      within('.simple_form') do
        click_on 'Add placement'
      end

      within('.placement_title') do
        expect(page).to have_content("can't be blank")
      end
      within('.placement_address') do
        expect(page).to have_content("can't be blank")
      end
      within('.placement_photos') do
        expect(page).to have_content("can't be blank")
      end
      within('.placement_price') do
        expect(page).to have_content("can't be blank")
      end
    end

    scenario 'with not unique address' do
      placement = FactoryGirl.create(:placement, address: 'Kyiv, UA')

      fill_in :placement_address, with: placement.address

      within('.simple_form') do
        click_on 'Add placement'
      end

      within('.placement_address') do
        expect(page).to have_content('has already been taken')
      end
    end
  end
end
