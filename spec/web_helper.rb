def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test@example.com')
end

def sign_up_with_another_user
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test2@example.com')
end

def sign_up_with_yet_another_user
  click_link 'Sign out'
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test3@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test3@example.com')
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review McDonalds'
  fill_in 'Thought', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
