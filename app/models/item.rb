class Item < ApplicationRecord
  # has_one :purchase_record
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipcost
  belongs_to :shiparea
  belongs_to :daystoship

  validates :image, presence: true
  validates :items_name, presence: true
  validates :items_information, presence: true
  validates :category_id, presence: true
  validates :item_state_id, presence: true
  validates :shipcost_id, presence: true
  validates :shiparea_id, presence: true
  validates :daystoship_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :item_state_id, :shipcost_id, :shiparea_id, :daystoship_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
