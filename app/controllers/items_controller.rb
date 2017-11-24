  class ItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @user = current_user
    @todo_item = @todo_list.items.create(item_params)

    redirect_to user_todo_list_path(@user, @todo_list)
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Item deleted."
    else
      flash[:error] = "Item could not be deleted."
    end
    redirect_to user_todo_list_path(@user, @todo_list)
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to user_todo_list_path(@user, @todo_list), notice: "Item completed"
  end

  private

  def set_todo_list
    @user = current_user
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @user = current_user
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.items.find(params[:id])
  end

  def item_params
    params[:item].permit(:name)
  end

end
