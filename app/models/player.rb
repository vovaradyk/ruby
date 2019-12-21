class Player < ApplicationRecord
  belongs_to :team
  validates :name, :presence => {:message => "Вкажіть ім'я"}
  validates :height, numericality: {greater_than: 0, :message => "3pіст повинен бути більшим за 0"}
  validates :weight, numericality: {greater_than: 0, :message => "Вага повинна бути більшою за 0"}
  validates :birthday, :presence => {:message => "Вкажіть дату народження"}
end
