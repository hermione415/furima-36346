class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name,
                :telephone_number, :token

  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}+\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   address: address, building_name: building_name, telephone_number: telephone_number)
  end
end
