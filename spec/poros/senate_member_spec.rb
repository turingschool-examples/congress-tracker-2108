require 'rails_helper'
# testing guide: 
# 1. methods that are in the poro 
# 2. attributes that are in the poro 
describe SenateMember do 
    it 'has attributes' do 
        senate_member = SenateMember.new(senate_member_data)

        expect(senate_member.first_name).to eq("Cory")
        expect(senate_member.last_name).to eq("Booker")
        expect(senate_member.twitter_account).to eq("SenBooker")
    end 
end 