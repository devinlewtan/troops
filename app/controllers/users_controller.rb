class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @user_ingredients = @user.user_ingredients.paginate(page: params[:page])
  end
  
  def new
  @user = User.new
  end
  
  def create
  #initialize new User object with appropriate parameters
  @user = User.new(user_params)
  	# Handle a successful save.
    if @user.save
    	#go to user page
    	redirect_to user_url(@user) 
    else
    #page dispaying errors
      render 'new'
    end
  end
  
  #clarify appropriate params
   private
    	def user_params
      		params.require(:user).permit(:name, :email, :password, :password_confirmation)
    	end
  
end
