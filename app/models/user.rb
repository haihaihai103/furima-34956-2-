class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items
  has_many :customers
  has_many :sns_credentials
  has_many :card, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} do
      validates :last_name_kana 
      validates :first_name_kana
    end
   end

   def self.from_omniauth(auth)
     sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
     user = User.where(email: auth.info.email).first_or_initialize(
       nickname: auth.info.name,
          email: auth.info.email,
     first_name: auth.info.first_name,
      last_name: auth.info.last_name
        )

    if user.persisted?
      sns.user = user
      sns.save
   end
   { user: user, sns: sns }
  end
end