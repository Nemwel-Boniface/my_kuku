class EggsController < ApplicationController
  # List all eggs and stats (index remains unchanged)
  def index
    @eggs = Egg.all
    @egg_stats = Egg.total_eggs_and_prices
  end

  # Display the form for creating a new egg record
  def new
    @egg = Egg.new
  end

  # Create a new egg record
  def create
    @egg = Egg.new(egg_params)
    if @egg.save
      redirect_to eggs_path, notice: 'Egg was successfully recorded.'
    else
      render :new
    end
  end

  # Display the form for editing an existing egg record
  def edit
    @egg = Egg.find(params[:id])
  end

  # Update an existing egg record
  def update
    @egg = Egg.find(params[:id])
    if @egg.update(egg_params)
      redirect_to eggs_path, notice: 'Egg was successfully updated.'
    else
      render :edit
    end
  end

  # Delete an egg record
  def destroy
    @egg = Egg.find(params[:id])
    @egg.destroy
    redirect_to eggs_path, notice: 'Egg was successfully deleted.'
  end

  private

  # Strong parameters for egg attributes
  def egg_params
    params.require(:egg).permit(:egg_count, :egg_size, :poultry_type, :laid_on, :price_per_egg)
  end
end
