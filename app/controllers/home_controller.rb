class HomeController < ApplicationController
  def index
	if user_signed_in?
		redirect_to :controller => 'todos', :action => 'index'
	end
  end
  
  def create
  @user = User.create( user_params )
end

def user_params
  params.require(:user).permit(:avatar)
end  
  
  
end
