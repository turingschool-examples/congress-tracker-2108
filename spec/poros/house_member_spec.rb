require 'rails_helper'
# testing guide: 
# 1. methods that are in the poro 
# 2. attributes that are in the poro 
describe HouseMember do 
    it 'has attributes' do 
        senate_member = HouseMember.new(house_member_data)

        expect(senate_member.name).to eq("Diana DeGette")
        expect(senate_member.role).to eq("Representative")
        expect(senate_member.party).to eq("D")
        expect(senate_member.district).to eq("1")
    end 
end 