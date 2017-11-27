class TodoListsController < ApplicationController
  before_action :set_todo_list, except: [:new, :create]

  def index
    @todo_lists = TodoList.all
  end

  def show
    @user = current_user
    @todo_list = TodoList.friendly.find(params[:id])
  end

  def new
    @user = current_user
    @todo_list = TodoList.new
  end

  def edit
    @user = current_user
    @todo_list = TodoList.friendly.find(params[:id])
  end

  def create
    @user = current_user
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user = @user

    if @todo_list.save
      flash[:notice] = "Post was saved."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @user = current_user
    @todo_list = TodoList.friendly.find(params[:id])
    @todo_list.assign_attributes(todo_list_params)

    if @todo_list.save
      flash[:notice] = "\"#{@todo_list.title}\" has been updated."
      redirect_to user_todo_list_path(@user, @todo_list)
    else
      flash.now[:alert] = "There was an error updating the entry. Please try again."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @todo_list = TodoList.friendly.find(params[:id])
    if @todo_list.destroy
      flash[:success] = "List deleted."
    else
      flash[:error] = "List could not be deleted."
    end
    redirect_to root_path
  end

  private
    def set_todo_list
      @todo_list = TodoList.friendly.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :user_id, :slug)
    end
end
