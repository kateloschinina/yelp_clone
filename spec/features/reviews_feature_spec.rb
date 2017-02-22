require 'rails_helper'

feature 'reviewing' do
  let!(:kfc){ Restaurant.create(name:'KFC') }

  scenario 'allows users to leave a review using a form' do
     visit '/restaurants'
     click_link 'Review KFC'
     fill_in "Thought", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'
     click_link 'KFC'
     expect(page).to have_content('so so')
  end

end
