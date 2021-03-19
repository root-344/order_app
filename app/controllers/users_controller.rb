class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @store = user.store
    @items = user.items
  end
end
