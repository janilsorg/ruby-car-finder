class Carro < ApplicationRecord
  belongs_to :marca
  belongs_to :modelo
  belongs_to :color
  belongs_to :transmission
end
