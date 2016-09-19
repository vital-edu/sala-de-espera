require 'rails_helper'

RSpec.describe Service, type: :model do

  describe 'service validation' do
    context 'presence' do
      it { should validate_presence_of(:schedule) }
      it { should validate_presence_of(:status) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:service_category_id) }
    end
  end

end
