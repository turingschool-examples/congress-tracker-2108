class CongressController < ApplicationController

  def search
    @member = CongressFacade.find_senate_member(params[:search])
    render "search/index"
  end

  def search_state
    state = params[:state]
    @house_members = CongressFacade.house_members_by_state(state)
    render "search/index"
  end

end
