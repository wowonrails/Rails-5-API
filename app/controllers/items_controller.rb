class ItemsController < ApplicationController

  include TodoContext

  before_action :require_login
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  def index
    json_response(@todo.items)
  end

  def show
    json_response(@item)
  end

  def create
    @todo.items.create!(item_params)
    json_response(@todo, :created)
  end

  def update
    @item.update(item_params)
    head :no_content
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end
end
