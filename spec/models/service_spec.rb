require 'rails_helper'

RSpec.describe Service, type: :model do

  describe 'service validation' do
    context 'presence' do
      before(:each) do
        @service = create(:service)
      end

      it { expect(@service).to validate_presence_of(:status) }
      it { expect(@service).to validate_presence_of(:employee) }
      it { expect(@service).to validate_presence_of(:service_category) }
      it { expect(@service).to validate_presence_of(:status) }
    end
  end

end
