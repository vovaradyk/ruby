class Company < ApplicationRecord
  belongs_to :city
  validates :name, :presence => {:message => "Вкажіть назву"}
  validates :address, :presence => {:message => "Вкажіть адресу"}
  validates :phone, :presence => {:message => "Вкажіть номер телефону"}
  validates :city_id, numericality: {greater_than: -1}
  validates :year, numericality: {greater_than: 1900, :message => "Рік заснування повинен бути більшим за 1900"}
end
