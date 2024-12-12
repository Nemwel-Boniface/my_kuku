class ChickensController < ApplicationController
  before_action :set_chicken, only: %i[show edit update destroy]

  # GET /chickens or /chickens.json
  def index
    @chickens = Chicken.all
  end

  # GET /chickens/1 or /chickens/1.json
  def show
    @chicken = Chicken.friendly.find(params[:id])
  end

  # GET /chickens/new
  def new
    @chicken = Chicken.new
  end

  # GET /chickens/1/edit
  def edit; end

  # POST /chickens or /chickens.json
  def create
    @chicken = Chicken.new(chicken_params)

    respond_to do |format|
      if @chicken.save
        format.html { redirect_to chickens_path, notice: 'Poultry was successfully created.' }
        format.json { render :show, status: :created, location: @chicken }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chickens/1 or /chickens/1.json

  def update
    additional_poultry = params[:chicken][:no_of_poultry].to_i
    @chicken.no_of_poultry += additional_poultry

    if @chicken.save
      flash[:notice] = "#{additional_poultry} more #{@chicken.poultry_type.pluralize} added successfully."
      redirect_to chickens_path
    else
      flash[:alert] = 'There was an error updating the poultry.'
      render :edit
    end
  end

  # DELETE /chickens/1 or /chickens/1.json
  def destroy
    @chicken.destroy

    respond_to do |format|
      format.html { redirect_to chickens_url, notice: 'Poultry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chicken
    @chicken = Chicken.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chicken_params
    params.require(:chicken).permit(:no_of_poultry, :age, :date_hatched, :parent_id, :user_id, :chicken_image,
                                    :poultry_type, :price_per_poultry)
  end
end
