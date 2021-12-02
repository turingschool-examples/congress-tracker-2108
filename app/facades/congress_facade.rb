class CongressFacade 
    # 1. call to service(s)
    # 2. manage that data from the services, and create an 
    # object to send back to the view
    def self.find_senate_member(search_param)
        senate_members = CongressService.senate_members
        # from the data that came back from the api endpoint, we're grabbing the value that has the data we need 
        members = senate_members[:results][0][:members]

        # searching for the senate member by last name inputed by user
        found_members = members.find_all {|m| m[:last_name] == search_param}
        SenateMember.new(found_members.first)
    end 
end 