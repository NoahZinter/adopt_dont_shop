require 'rails_helper'

describe 'admin petitions index' do
  before :each do
    @petition = Petition.create!(name: 'Ted Leo',
                                 street_address: '123 Pharmacist Ln',
                                 city: 'Denver',
                                 state: 'Co',
                                 zipcode: 12345,
                                 goodhome: 'Lurv Fluffers',
                                 status: 'Pending')

    @petition_2 = Petition.create!(name: 'Thao Nguyen',
                                 street_address: '123 Pharmacist Ln',
                                 city: 'Denver',
                                 state: 'Co',
                                 zipcode: 12345,
                                 goodhome: 'Lurv Fluffers',
                                 status: 'Pending')

  end

  it 'contains a link to each petition' do

  end

end