class MachineSnack < ApplicationRecord
  validates :machine_id, presence: true
  validates :snack_id, presence: true
end
