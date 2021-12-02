require 'rails_helper'
# testing guide: 
# 1. test the return value -- will usually be a poro or a collection of poros
describe 'Congress Facade' do 
    it '.find_senate_member', :vcr do 
        senate_member = CongressFacade.find_senate_member('Booker')

        expect(senate_member).to be_a SenateMember
        expect(senate_member.last_name).to eq("Booker")
    end 
end 