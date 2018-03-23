class SearchesController < ApplicationController
  def index
    @searches = Search.all

    respond_to do |format|
      format.html
    end
  end

  def create
    @search = Search.new(search_params)

    if @search.save
      respond_to do |format|
        format.js
      end
    else
      head :unprocessable_entity
    end
  end

  private

  def search_params
    params.require(:search).permit(:keyword)
  end
end
