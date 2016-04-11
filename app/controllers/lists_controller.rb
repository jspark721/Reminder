class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = "To-do list was saved."
      redirect_to @list
    else
      flash.now[:alert] = "There was an error saving the To-do list. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @list.save
      flash[:notice] = "To-do list was updated."
      redirect_to @list
    else
      flash.now[:alert] = "There was an error updating the To-do list. Please try again."
      render :edit
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = "To-do list was deleted."
      redirect_to lists_path
    else
      flash.now[:alert] = "There was an error deleting the To-do list. Please try again."
      render :show
    end
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :description)
    end
end
