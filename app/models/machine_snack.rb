class MachineSnack < ApplicationRecord
  validates :machine_id, presence: true
  validates :snack_id, presence: true

  belongs_to :snack
  belongs_to :machine
end
