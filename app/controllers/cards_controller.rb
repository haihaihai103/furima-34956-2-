class CardsController < ApplicationController

  def new
    #@card = Card.new
  end

  def create
    @card = Card.new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
      description: 'test', # テストカードであることを説明
      card: params[:card_token] # 登録しようとしているカード情報
    )
  card = Card.new( 
    card_token: params[:card_token],  #カード情報
    customer_token: customer.id, 
    user_id: current_user.id 
  )
  if card.save
    redirect_to root_path
  else
    render("cards/new") # カード登録画面へリダイレクト
  end
end

end