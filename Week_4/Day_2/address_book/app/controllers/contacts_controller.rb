class ContactsController < ApplicationController
  def index
    @contacts = Contact.order(name: :desc)
  end

  def new
    @validate = [1,1,1,1]
  end
  def create
    validate = [0,0,0,0]
    params[:contact][:name] != "" ? validate[0] = 1 : text = "Incorrect name"
    params[:contact][:address] != "" ? validate[1] = 1 : text = "Incorrect address"
    params[:contact][:phone].match(/\A\d{9}\z/) != nil ? validate[2] = 1 : text = "Incorrect phone number (remmember: 9 digits)"
    params[:contact][:email].match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i) != nil ? validate[3] = 1 : text = "Incorrect email"

    if validate.index(0) == nil
      contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone => params[:contact][:phone],
        :email => params[:contact][:email])
      contact.save
      redirect_to("/contacts")
    else
      @contact = params[:contact]
      @validate = validate
      @style = "background-color: #FFCCCC"
      @validation = text
      render 'new'
    end
  end
  def moreinfo
    @contact = Contact.find_by(id: params[:id])
    @avatar = Avatar.find_by(userid: params[:id])
  end
  def favorite
    @contact = Contact.find_by(id: params[:id])
    @contact.status = 'favorite'
    @contact.save
    render 'moreinfo'
  end
  def search
    inputname = params[:contact][:name].split('')
    @contacts = []
    Contact.all.each do |cont|
      namedb = cont.name.split('')
      i = 0
      inputname.each_with_index do |letter,index|
        i += 1 if letter == namedb[index]
      end
      @contacts.push(cont) if i == inputname.length
    end

  end
  def avatar
    render :text => avatar_params.inspect
  end
end
