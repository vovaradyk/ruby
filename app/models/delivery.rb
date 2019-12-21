class Delivery < ApplicationRecord
  belongs_to :city
  belongs_to :company
  validates :name, :presence => {:message => "Вкажіть товар"}
  validates :price, numericality: {greater_than: 0, :message => "Вартість повинна бути більшою за 0"}
end
