class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})

    # BCrypt::Password.new(encrypted) == secret
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        flash["notice"] = "Welcome."
        redirect_to "/places"
      else 
        flash["notice"] = "Nope."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  