class SignupController < ApplicationController
  
  def index
  end

  def registration
    @user = User.new
  end

  def sms
    @user = User.new  
  end

 
  def address
    @user = User.new
  end

  def create
  end

  def creditcard
    @user = User.new
  end

  def complete
  end

 
end