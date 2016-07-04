class AsciisController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text]
    a = Artii::Base.new
    @result = a.asciify(@text)
    render 'results'
  end
end
