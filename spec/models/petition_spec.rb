require 'rails_helper'

RSpec.describe Petition do
  describe 'relationships' do
    it { should have_many(:pet_petitions) }
    it { should have_many(:pets).through(:pet_petitions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
  end
end
