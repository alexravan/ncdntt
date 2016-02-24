require 'rails_helper'

describe Incident do
	it "has a valid factory" do
		expect(FactoryGirl.create(:incident)).to be_valid
	end
	it "is invalid without a location" do 
		expect(FactoryGirl.build(:incident, location: nil)).to_not be_valid
	end
	it "is invalid without a title" do 
		expect(FactoryGirl.build(:incident, title: nil)).to_not be_valid
	end
	it "is invalid without a severity" do 
		expect(FactoryGirl.build(:incident, severity: nil)).to_not be_valid
	end
	it "is invalid without a category" do 
		expect(FactoryGirl.build(:incident, category: nil)).to_not be_valid
	end
	it "is invalid without a user id" do 
		expect(FactoryGirl.build(:incident, user_id: nil)).to_not be_valid
	end
end