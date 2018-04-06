class Snack < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :machine_snacks
end
