class AccessController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize    
  def index
  end 
  def new
      if session[:user_id]       
          redirect_to root_url, notice: "already logged on" 
          return 
      end 
  end

  def create
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            puts "correct login"
            redirect_to root_url
        else
            flash[:danger] = 'Invalid email/password combination' 
            session[:user_id] = '00000'
            puts "incorrect login"
            redirect_to root_url
        end
  end 
    
  def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out"
  end 
   
  private

  def user_params
      params.require(:user).permit(:name, :password)
  end 
    
end
