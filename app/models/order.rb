class Order < ApplicationRecord
    #0は入金待ち（デフォルト）、１は入金確認、２は製作中、３は発送準備中、４は発送済み
  enum status: { waiting_payment: 0, payment_confirm: 1, in_production: 2, ready_to_ship: 3, shipped: 4 }
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment: { クレジットカード: 0, 銀行振込: 1 }
end
