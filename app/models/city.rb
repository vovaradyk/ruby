class City < ApplicationRecord
  validates :name, :presence => {:message => "Вкажіть ім'я"}
  validates :state, :presence => {:message => "Вкажіть штат"}
  validates :country, :presence => {:message => "Вкажіть країну"}
  validates :timezone, :presence => {:message => "Вкажіть часовий пояс"}
  validates :postcode, :presence => {:message => "Вкажіть поштовий індекс"}
end
