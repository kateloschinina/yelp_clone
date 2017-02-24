require 'rails_helper'

feature 'reviewing' do
  before do
    sign_up
    @user.restaurants.create(name: 'McDonalds')
    click_link 'Sign out'
    sign_up_with_another_user
  end

  scenario 'allows users to leave a review using a form' do
    leave_review("aight", '3')
    click_link 'McDonalds'
    expect(page).to have_content('aight')
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    sign_up_with_yet_another_user
    leave_review('Great', '5')
    click_link 'McDonalds'
    expect(page).to have_content('Average Rating: ★★★★☆')
  end

end
