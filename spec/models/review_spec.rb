require 'rails_helper'

describe Review, type: :model do
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  context "associations" do
    it "it belongs to restaurant" do
      should belong_to :restaurant
    end
    it "it belongs to user" do
      should belong_to :user
    end
  end

end
