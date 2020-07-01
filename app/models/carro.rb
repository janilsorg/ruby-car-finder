class Carro < ApplicationRecord
  belongs_to :marca
  belongs_to :modelo
  belongs_to :cor
  belongs_to :transmission
  belongs_to :corpo
  belongs_to :marca
end
