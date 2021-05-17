class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :days_ship
  belongs_to :status
  has_one_attached :image
  #has_one :customers

  with_options presence: true do
    validates :title
    validates :concept
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :area_id
      validates :burden_id
      validates :status_id
      validates :days_ship_id
  end
end