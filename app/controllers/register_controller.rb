class RegisterController < ApplicationController

  def new
    use = User.new
  end

  def signup
    use = User.new(username: params[:register][:username], password: params[:register][:password])
    use= User.find.by(username: params[:register][:username])

    if use.present?
      flash[:error] = "User already exist please login"
      redirect_to login_path
    else
      use = User.new(username:params[:resgister][:username], password:params[:register][:password])
      use.save
      flash[:success] = "Registration Successful"
      redirect_to login_path
    end
  end
end