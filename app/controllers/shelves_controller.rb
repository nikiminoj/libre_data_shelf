class ShelvesController < ApplicationController
  before_action :set_shelf, only: %i[ show edit update destroy ]

  # GET /shelves or /shelves.json
  def index
    @shelves = Shelf.all
  end

  # GET /shelves/1 or /shelves/1.json
  def show
  end

  # GET /shelves/new
  def new
    @shelf = Shelf.new
  end

  # GET /shelves/1/edit
  def edit
  end

  # POST /shelves or /shelves.json
  def create
    @shelf = Shelf.new(shelf_params)

    respond_to do |format|
      if @shelf.save
        format.html { redirect_to @shelf, notice: "Shelf was successfully created." }
        format.json { render :show, status: :created, location: @shelf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelves/1 or /shelves/1.json
  def update
    respond_to do |format|
      if @shelf.update(shelf_params)
        format.html { redirect_to @shelf, notice: "Shelf was successfully updated." }
        format.json { render :show, status: :ok, location: @shelf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelves/1 or /shelves/1.json
  def destroy
    @shelf.destroy!

    respond_to do |format|
      format.html { redirect_to shelves_path, status: :see_other, notice: "Shelf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelf_params
      params.require(:shelf).permit(:mac_address, :mac_weight, :comment, :company_id, :product_id, :last_shelf_stat, :refill_shelf_stat, :grap_shelf_stat)
    end
end
