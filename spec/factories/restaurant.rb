FactoryGirl.define do
    factory :restaurant do
    	id Random.rand(100)
        name 'Bistro'
        description 'Italian food'
        street 'Nuburry Street'
        city 'Boston'
        state 'Iowa'
        zip '02156'
        phone '123-867-5309'
    end
end