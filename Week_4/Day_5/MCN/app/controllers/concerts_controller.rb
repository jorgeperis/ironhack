class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
    @cities = []
    @citiesall = City.all
    @citiesall.each do |city|
      @cities.push(city.city)
    end
  end
  def create
    @concert = Concert.create(concert_params)
    redirect_to '/'
  end
  def index
    @concerts = Concert.where(date: Time.zone.now..Time.zone.now.end_of_day)
    @concertsmonth = Concert.where( date: Time.zone.now.end_of_day..Time.zone.now.end_of_month)
  end
  def details
    @concert = Concert.find(params[:id])
    @comment = Comment.new
  end

  def popular
    @concerts = Concert.where( date: Time.zone.now.end_of_day..Time.zone.now.end_of_month).order(:count_comments).limit(10).reverse
    render 'show'
  end

  def price
    @concerts = Concert.where("price <= ?", params[:q]).order(:price)
    render 'show'
  end
  def concert_params
    params.require(:concert).permit(:artist, :venue, :date, :price, :description, :avatar, :city)
  end

end
