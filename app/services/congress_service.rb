class CongressService 
    def self.senate_members
        # establishing faraday connection object
        Rails.cache.fetch('senate-members') do 
            conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
                faraday.headers["X-API-KEY"] = ENV['govt_api_key']
            end
            
            # using faraday connection to get a response
            response = conn.get("/congress/v1/116/senate/members.json")
            JSON.parse(response.body, symbolize_names: true)
        end 
    end 

    def self.house_members(state)
        conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
            faraday.headers["X-API-KEY"] = ENV['govt_api_key']
        end
    
        response = conn.get("/congress/v1/members/house/#{state}/current.json")
    
        JSON.parse(response.body, symbolize_names: true)
    end 
end 