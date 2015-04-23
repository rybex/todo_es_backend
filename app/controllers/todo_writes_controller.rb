class TodoWritesController < ApplicationController

  def create_list
    respond_to do |format|
      format.json  { render :json => "list created" }
    end
  end

  def remove_list
    respond_to do |format|
      format.json  { render :json => "list removed" }
    end
  end

  def add_todo_item
    respond_to do |format|
      format.json  { render :json => "item added" }
    end
  end

  def remove_todo_item
    respond_to do |format|
      format.json  { render :json => "item removed" }
    end
  end
end