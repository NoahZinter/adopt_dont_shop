require 'rails_helper'

describe 'admin shelters show' do
  before :each do
    @shelter = Shelter.create!(foster_program: true, name: "Aurora Pet Home", city: "Aurora, CO", rank:5)
    @pet_1 = @shelter.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)
    @petition = Petition.create!(name: 'Ted Leo',
                                street_address: '123 Pharmacist Ln',
                                city: 'Denver',
                                state: 'Co',
                                zipcode: 12_345,
                                goodhome: 'Lurv Fluffers',
                                status: 'Pending')
    @pet_petition = PetPetition.create!(petition: @petition, pet: @pet_1, status: 'Approved')
    visit "/admin/shelters/#{@shelter.id}"
  end

  it 'displays the name and full address of the shelter' do
    expect(page).to have_content('Shelter Name: Aurora Pet Home')
    expect(page).to have_content('Shelter Location: Aurora, CO')
  end

  it 'has a statistics section' do
    expect(page).to have_content('Statistics')
  end

  it 'lists the average age of adoptable pets for a shelter' do
    expect(page).to have_content('Average Age of Adoptable Pets: 4.0')
  end

  it 'lists the number of adoptable pets for a shelter' do
    expect(page).to have_content('Number of Adoptable Pets: 2')
  end

  it 'lists the number of adopted pets for a shelter' do
    expect(page).to have_content('Number of Adopted Pets: 1')
  end
end