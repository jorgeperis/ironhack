class UserController < ApplicationController

  def show
    @timeto = (@product.deadline - DateTime.now)
  end
end
