class AboutsController < ApplicationController
  before_action :set_about, only: %i[ show edit update destroy ]

  # GET /abouts or /abouts.json
  def index
    @abouts = About.all
  end

  # GET /abouts/1 or /abouts/1.json
  def show
  end

  # GET /abouts/new
  def new
    @about = About.new
  end

  # GET /abouts/1/edit
  def edit
  end

  # POST /abouts or /abouts.json
  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to about_url(@about), notice: "About was successfully created." }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abouts/1 or /abouts/1.json
  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to about_url(@about), notice: "About was successfully updated." }
        format.json { render :show, status: :ok, location: @about }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1 or /abouts/1.json
  def destroy
    @about.destroy

    respond_to do |format|
      format.html { redirect_to abouts_url, notice: "About was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def about_params
      params.fetch(:about, {})
    end
end
