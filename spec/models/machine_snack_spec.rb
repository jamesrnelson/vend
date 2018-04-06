require 'rails_helper'

describe MachineSnack, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:machine_id) }
    it { should validate_presence_of(:snack_id) }
  end
end
