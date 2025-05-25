class ShelfStatsController < ApplicationController
  before_action :set_shelf_stat, only: %i[ show edit update destroy ]

  # GET /shelf_stats or /shelf_stats.json
  def index
    @shelf_stats = ShelfStat.all
  end

  # GET /shelf_stats/1 or /shelf_stats/1.json
  def show
  end

  # GET /shelf_stats/new
  def new
    @shelf_stat = ShelfStat.new
  end

  # GET /shelf_stats/1/edit
  def edit
  end

  # POST /shelf_stats or /shelf_stats.json
  def create
    @shelf_stat = ShelfStat.new(shelf_stat_params)

    respond_to do |format|
      if @shelf_stat.save
        format.html { redirect_to @shelf_stat, notice: "Shelf stat was successfully created." }
        format.json { render :show, status: :created, location: @shelf_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shelf_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelf_stats/1 or /shelf_stats/1.json
  def update
    respond_to do |format|
      if @shelf_stat.update(shelf_stat_params)
        format.html { redirect_to @shelf_stat, notice: "Shelf stat was successfully updated." }
        format.json { render :show, status: :ok, location: @shelf_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shelf_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelf_stats/1 or /shelf_stats/1.json
  def destroy
    @shelf_stat.destroy!

    respond_to do |format|
      format.html { redirect_to shelf_stats_path, status: :see_other, notice: "Shelf stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf_stat
      @shelf_stat = ShelfStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelf_stat_params
      params.require(:shelf_stat).permit(:weight, :weight_percent, :product_count, :product_count_real, :temperature_violation, :timedelta, :weight_increment, :weight_decrement, :shelf_id)
    end
end
