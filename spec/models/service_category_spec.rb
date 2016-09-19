require 'rails_helper'

RSpec.describe ServiceCategory, type: :model do

  describe 'service category validation' do
    context 'presence' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:price) }
    end
  end

end
