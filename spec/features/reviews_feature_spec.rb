require 'rails_helper'

feature 'reviewing' do
  # let!(:mcdonalds){ Restaurant.create(name:'McDonalds') }

  scenario 'allows users to leave a review using a form' do
    sign_up
    @user.restaurants.create(name: 'McDonalds')
    click_link 'Sign out'
    sign_up_with_another_user
    visit '/'
    click_link 'Review McDonalds'
    fill_in "Thought", with: "aight"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'McDonalds'
    expect(page).to have_content('aight')
  end

end
