class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show,:edit]

  def show
    @user = authorize User.find(params[:id])
  end
end
