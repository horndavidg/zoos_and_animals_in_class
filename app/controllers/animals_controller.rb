class AnimalsController < ApplicationController
	before_action :find_zoo, only: [:index, :new, :create]
	before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def index
  	# @zoo = Zoo.find_by_id(params[:zoo_id])
  end

  def new
  	# @zoo = Zoo.find_by_id(params[:zoo_id])
  	@animal = Animal.new
  end

  def create
  	@animal = @zoo.animals.new( animal_params )
  	# @animal.save

  	if @animal.save 
  		redirect_to zoo_animals_path(@zoo), flash: {success: "Added that animal for ya."}	
  	else
  		render :new
  	end

  end

  def show
  	
  end

  def edit

  end

  def update
  	@animal.update(animal_params)
  	if @animal.save 
  		redirect_to zoo_animals_path(@animal)
  	else
  		render :edit
  	end
  end

  def destroy
  	@animal.destroy
  	redirect_to zoo_animals_path(@animal)
  end

  private
  def find_zoo
  	@zoo = Zoo.find_by_id(params[:zoo_id])
  end
  def find_animal
  	@animal = Animal.find_by_id(params[:id])
  end
  def animal_params
  	params.require(:animal).permit(:name, :species)
  end

end
