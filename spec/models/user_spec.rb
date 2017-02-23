require 'rails_helper'

describe User, type: :model do
  
  context "association" do
    it "user has many restaurants" do
      should have_many(:restaurants)
    end
  end

end
