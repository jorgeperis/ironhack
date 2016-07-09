class LinksController < ApplicationController

  def create
    result = Link.encrypt(params[:q])
    @result = request.base_url + "/" + result
  end

  def visited
    @visited = Link.order(:visit).reverse
  end

  def redirect
    url = Link.find_by(short: params[:shortlink])
    url.visit += 1
    url.save
    redirect_to url.original
  end
end
