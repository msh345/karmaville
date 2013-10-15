class UsersController < ApplicationController
  def index
    if params[:page]
      @users = User.by_karma.page(params[:page])
    else
      @users = User.by_karma.limit(50)
    end
  end
end
