class SenateMember 
    attr_reader :first_name, :last_name, :twitter_account
    def initialize(senate_member_data)
        @first_name = senate_member_data[:first_name]
        @last_name = senate_member_data[:last_name]
        @twitter_account = senate_member_data[:twitter_account]
    end 

end 