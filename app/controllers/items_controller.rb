class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # require 'payjp'
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    # 出品機能未実装のため仮置き
    @user = User.find(1)
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.item_images.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create

    @item = Item.new(item_params)
    #まだView設定がまだのため仮の登録データ、あとでViewからのデータをitem_paramsで定義します。
    watasi = "hoge"

    @item.upper_category = watasi
    @item.middle_category = watasi
    @item.lower_category = watasi
    @item.seller = watasi
    @item.size_type = watasi
   
    
    
    @item.save
    redirect_to root_path
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      # 出品機能未実装のため仮置き
        @item = Item.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      #params.require(:item).permit( :name, :content, :price, :prefecture_code, :status, :size_type, :seller, :created_at, :updated_at, :category_id, :condition_id,  :delivery_charge, :delivery_days　)#.merge(user_id: current_user.id)
      params.require(:item).permit(:name,:content,:category_id,:condition_id,:delivery_charge,:prefecture_code,:delivery_days,:price,item_images_attributes: [:image])
      
    end
end
