FactoryGirl.define do 
	factory :incident do |f|
		f.location "Halligan"
		f.title "There's a fire"
		f.severity 4
		f.user_id 5
		f.category 2
	end

	factory :invalid_incident, parent: :incident do |f|
		f.location nil 
	end 
end