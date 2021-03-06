class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card,only: [:index,:pay ]
  Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  def index
    @item = Item.find_by(params[:id])
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      #現状未実装の為一時的にコメントアウト
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
    Payjp::Charge.create(
    amount: 190, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
   end

end