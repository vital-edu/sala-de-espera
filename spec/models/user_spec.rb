require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation' do
    context 'presence' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:cpf) }
      it { should validate_presence_of(:rg) }
    end

    context 'length' do
      it { should validate_length_of(:name).is_at_least(1).is_at_most(100) }
    end
  end
end
