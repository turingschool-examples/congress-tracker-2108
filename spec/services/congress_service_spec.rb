require 'rails_helper'
# testing guide: 
# - test structure that comes back from the api call 
#     1. test presence of keys 
#     2. test data type of values - string always for json 

RSpec.describe 'Propublica Congress Service' do
  describe 'happy path' do
    it 'can get all senate member data', :vcr do 
        response = CongressService.senate_members

        expect(response).to be_a Hash 
        expect(response[:results][0][:members]).to be_a Array 

        first_senator_data = response[:results][0][:members].first

        expect(first_senator_data).to have_key :first_name
        expect(first_senator_data[:first_name]).to be_a String

        expect(first_senator_data).to have_key :last_name
        expect(first_senator_data[:last_name]).to be_a String

        expect(first_senator_data).to have_key :twitter_account
        expect(first_senator_data[:twitter_account]).to be_a String

    end 

    it 'can get all house members for a specific state', :vcr do 
      response = CongressService.house_members('CO')

      expect(response).to be_a Hash 
      expect(response[:results]).to be_a Array 

      house_member = response[:results].first

      expect(house_member[:name]).to be_a String
      expect(house_member[:role]).to be_a String
      expect(house_member[:party]).to be_a String
      expect(house_member[:district]).to be_a String
    end 
  end 
end 