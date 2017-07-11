class ItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @user = current_user
    @todo_item = @todo_list.items.create(item_params)

    redirect_to user_todo_list_path(@todo_list)
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def item_params
    params[:item].permit(:name)
  end

end
