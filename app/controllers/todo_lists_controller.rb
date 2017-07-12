class TodoListsController < ApplicationController
  before_action :set_todo_list, except: [:new, :create]
  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    @user = current_user
    @todo_list = TodoList.find(params[:id])
  end

  # GET /todo_lists/new
  def new
    @user = current_user
    @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
    @user = current_user
    @todo_list = TodoList.find(params[:id])
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user = current_user

    if @todo_list.save
      flash[:notice] = "Post was saved."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    @todo_list = TodoList.find(params[:id])
    @todo_list.assign_attributes(todo_list_params)

    if @todo_list.save
      flash[:notice] = "\"#{@todo_list.title}\" has been updated."
      redirect_to @todo_list
    else
      flash.now[:alert] = "There was an error updating the entry. Please try again."
      render :edit
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :user_id)
    end
end
