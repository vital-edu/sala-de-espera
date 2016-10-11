require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'role validation' do
    context 'name' do
      it { should validate_inclusion_of(:name).in_array(%w(manager client employee)) }
    end
  end
end
