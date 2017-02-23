require 'rails_helper'

feature 'reviewing' do
  let!(:mcdonalds){ Restaurant.create(name:'McDonalds') }

  scenario 'allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    click_link 'Review McDonalds'
    fill_in "Thought", with: "aight"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'McDonalds'
    expect(page).to have_content('aight')
  end

end
