class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
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

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :description)
    end
end
