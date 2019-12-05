class SignupController < ApplicationController
  
  def index
  end

  def registration
    @user = User.new
  end

  def sms
    session[:nickname] = user_params[:nickname]
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:email] = user_params[:email]
    #session[:phone_number] = user_params[:phone_number]
    session[:password] = user_params[:password]
    
    @user = User.new( 
    # sessionに保存された値をインスタンスに渡す
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      # 入力前の情報は、バリデーションに通る値を仮で入れる
      last_name: "suzuki",
      first_name: "takuya",
      last_name_kana: "スズキ",
      first_name_kana: "タクヤ",
      #zip_code1: "000-0000",
      # { id: 1, name: '北海道' } で北海道を呼び出している
      #prefecture_id: "1",
      #city: "福岡市",
      #address1: "南区",
      #address2: "",
      #telephone: "",
    )
    render '/signup/registration' unless @user.valid?
  end

  def address
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      # 入力前の情報は、バリデーションに通る値を仮で入れる
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      #zip_code1: "000-0000",
      # { id: 1, name: '北海道' } で北海道を呼び出している
      #prefecture_id: "1",
      #city: "福岡市",
      #address1: "南区",
      #address2: "",
      #telephone: "",
    )
    render '/signup/sms' unless @user.valid?
  end

  def create
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:zip_code1] = user_params[:zip_code1]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:address1] = user_params[:address1]
    session[:address2] = user_params[:address2]
    #session[:telephone] = user_params[:telephone]
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    # 入力前の情報は、バリデーションに通る値を仮で入れる
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_name_kana: session[:last_name_kana],
    first_name_kana: session[:first_name_kana],
    #zip_code1: session[:zip_code1],
    # { id: 1, name: '北海道' } で北海道を呼び出している
    #prefecture_id: session[:prefecture_id],
    #city: session[:city],
    #address1: session[:address1],
    #address2: session[:address2],
    #telephone: user_params[:telephone],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to creditcard_signup_index_path
    else
      render '/signup/address'
    end
    
  end

  def creditcard
    @user = User.new
  end

  def complete

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number, :password, :birth_day,:birth_month, :birth_year, :self_introduce)
  end
 
end
