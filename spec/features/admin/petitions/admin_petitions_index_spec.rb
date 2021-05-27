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
    visit "/admin/petitions"
  end

  it 'contains a link to each petition' do
    expect(page).to have_link("Ted Leo's Application")
    expect(page).to have_link("Thao Nguyen's Application")
  end

  it 'clicking that link travels to application show page' do
    click_link("Ted Leo's Application")

    expect(current_path).to eq("/admin/petitions/#{@petition.id}")
  end
end
