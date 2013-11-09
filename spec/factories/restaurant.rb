FactoryGirl.define do
    factory :restaurant do
    	id Random.rand(100)
        name 'Bistro'
        description 'Italian food'
        street 'Nuburry Street'
        city 'Boston'
        state 'Iowa'
        zip '02156'
        
    end
end