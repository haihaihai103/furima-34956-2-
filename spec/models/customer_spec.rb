require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@customer).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @customer.token = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Token can't be blank")
    end
  end
end