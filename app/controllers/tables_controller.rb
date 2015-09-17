class TablesController < ApplicationController
  def index
    @tables = Table.all()
    
  end

  def edit
  end

  def new
  end

  def show
  end
end
