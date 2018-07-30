class UsersController < ApplicationController
  before_action :set_user_sexes, only: %i[edit]
  before_action :authenticate_admin!, only: %i[index update edit]
  before_action :set_user, except: %i[index new create]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to users_path, notice: 'Usuario actualizado!'
    else
      render :edit
    end
  end

  def edit
    @user_types = User.permission_levels.keys
  end

  private

  def set_user_sexes
    @user_sexes = User.sexes.keys
  end

  def set_user
    @user = User.find(params[:id])
  end



  def user_params
    params.require(:user).permit(:email, :nickname, :password, :permission_level, :avatar, :sex, :about, :state)
  end
end
