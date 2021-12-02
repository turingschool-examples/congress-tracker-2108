class CongressController < ApplicationController

  # 1. send object to the view instead of a hash 
  # 2. Separate 'logical portions'
  #   a. Making a call to api
  #   b. managing data 


  def search
    @member = CongressFacade.find_senate_member(params[:search])
    #rendering view 
    render "welcome/index"
  end

  def search_state
    state = params[:state]
    @house_members = CongressFacade.house_members_by_state(state)
    render "welcome/index"
  end
end
