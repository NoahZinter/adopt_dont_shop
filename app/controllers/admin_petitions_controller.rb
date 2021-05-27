class AdminPetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
    @associated_pet_petitions = @petition.associated_pet_petitions
  end

  def update
    @petition = Petition.find(params[:id])
    @pet = Pet.find(params[:pet])
    @pet_petition = PetPetition.select(@pet.id, @petition.id)
    @pet_petition.status = params[:approval]
    @pet_petition.save
    redirect_to "/admin/petitions/#{@petition.id}"
  end
end
