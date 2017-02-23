require 'rails_helper'

describe User, type: :model do

  context "association" do
    it "user has many restaurants" do
      should have_many(:restaurants)
    end
  end

  it { is_expected.to have_many :reviewed_restaurants }

end
