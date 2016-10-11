require 'rails_helper'

RSpec.describe ServiceCategory, type: :model do
  describe 'service category validation' do
    context 'presence' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:price) }
    end

    context 'length' do
      it { should validate_length_of(:name).is_at_least(1).is_at_most(100) }
    end
  end
end
