class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(params[:item].permit(:content))
  end

end
