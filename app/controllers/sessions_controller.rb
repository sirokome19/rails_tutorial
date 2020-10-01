class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # helperに渡す
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # render済のページにのみ表示
      render 'new'
    end
  end
  def destroy
  end
end
