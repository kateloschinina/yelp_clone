require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user = User.create(email: 'test@test.com', password: 'testtest')
    kfc = user.restaurants.create(name: 'The KFC')
    kfc.reviews.create(rating: 3, thought: 'It was an abomination', user_id: user.id)
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    # save_and_open_page
    click_link 'The KFC'
    click_link 'Endorse Review' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('0 endorsements') #wrong change later on
  end

end
