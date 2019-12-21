class Sponsor < ApplicationRecord
  validates :name, :presence => {:message => "Вкажіть назву"}
  validates :address, :presence => {:message => "Вкажіть адресу"}
  validates :payment, numericality: {greater_than: 0, :message => "Платіж за гру повинен бути більшим за 0"}
  validates :phone, :presence => {:message => "Вкажіть номер телефону"}
end
