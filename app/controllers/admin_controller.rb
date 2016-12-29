class AdminController < ApplicationController
  def index
    render :layout => false
    authorize! :read, Category.where(route: "admin").take
    flash[:success ] = "Success Flash Message: Welcome to GentellelaOnRails"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
  end
end
