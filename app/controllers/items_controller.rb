class ItemsController < ApplicationController
  before_action :set_list

  def create
    @item = @list.items.create(item_params)
    redirect_to @list
  end

  def destroy
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:success] = "To-Do list item was deleted."
    else
      flash[:error] = "To-Do list item could not be deleted."
    end
    redirect_to @list
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params[:item].permit(:content)
  end
end
