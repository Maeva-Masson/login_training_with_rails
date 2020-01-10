class UsersController < ApplicationController

  def home
  end

  def login
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def logout
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      session[:user_id] = nil
      flash[:info] = "Vous êtes maintenant déconnecté"
      redirect_to "/users/home"
    end
  end

  private

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
