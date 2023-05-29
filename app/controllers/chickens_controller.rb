class ChickensController < ApplicationController
  before_action :set_chicken, only: %i[ show edit update destroy ]

  # GET /chickens or /chickens.json
  def index
    @chickens = Chicken.all
  end

  # GET /chickens/1 or /chickens/1.json
  def show
  end

  # GET /chickens/new
  def new
    @chicken = Chicken.new
  end

  # GET /chickens/1/edit
  def edit
  end

  # POST /chickens or /chickens.json
  def create
    @chicken = Chicken.new(chicken_params)

    respond_to do |format|
      if @chicken.save
        format.html { redirect_to chicken_url(@chicken), notice: "Chicken was successfully created." }
        format.json { render :show, status: :created, location: @chicken }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chickens/1 or /chickens/1.json
  def update
    respond_to do |format|
      if @chicken.update(chicken_params)
        format.html { redirect_to chicken_url(@chicken), notice: "Chicken was successfully updated." }
        format.json { render :show, status: :ok, location: @chicken }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chickens/1 or /chickens/1.json
  def destroy
    @chicken.destroy

    respond_to do |format|
      format.html { redirect_to chickens_url, notice: "Chicken was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chicken
      @chicken = Chicken.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chicken_params
      params.require(:chicken).permit(:tag_number, :chicken_images, :age, :date_hatched, :parent_id)
    end
end
