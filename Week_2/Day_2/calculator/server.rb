require 'sinatra'
require 'sinatra/reloader'
require 'open-uri'
require 'json'
load 'lib/calculator.rb'


get '/' do
  @first_number = ""
  if File.exist?('public/store.txt')
    @first_number = IO.read('public/store.txt')
  end
  erb :main
end


get '/wordhour/:place' do
  @place_name = params[:place]
  url_get_coor = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@place_name}&key=AIzaSyA19JmNOs15vXiWPCBfb_8evKbr1hHSmLI"
  buffer = open(url_get_coor).read
  result_coor = JSON.parse(buffer)
  @lat = result_coor["results"][0]['geometry']['location']['lat']
  @lng = result_coor["results"][0]['geometry']['location']['lng']
  timestamp = Time.now.getutc
  url_get_hour = "https://maps.googleapis.com/maps/api/timezone/json?location=#{@lat},#{@lng}&timestamp=#{timestamp.to_i}&key=AIzaSyA19JmNOs15vXiWPCBfb_8evKbr1hHSmLI"
  buffer_get_hour = open(url_get_hour).read
  result_hour = JSON.parse(buffer_get_hour)
  offset_time = result_hour['rawOffset'] + result_hour['dstOffset']
  @place_time = (timestamp + offset_time).strftime("%d/%m/%Y %H:%M:%S")

  erb :place_coor
end

post "/calculate" do

  @operation = params["operation"]
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @operation_instance = Calculator.new(@first,@second)

  case @operation
    when "add"
      @result = @operation_instance.add
    when "substract"
      @result = @operation_instance.substract
    when "multiply"
      @result = @operation_instance.multiply
    when "divide"
      @result = @operation_instance.divide
    end
  erb :result
end

post "/store" do
  IO.write("public/store.txt",params["operation"])
  redirect to('/')
end
