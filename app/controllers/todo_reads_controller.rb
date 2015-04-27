class TodoReadsController < ApplicationController

  def list
    render json: { list: get_list, items: get_items}
  end

  private

  def get_list
    Todo::ReadModels::ListEntity.where(uid: params[:id])
  end

  def get_items
    Todo::ReadModels::ListItemEntity.where(list_uid: params[:id])
  end
end