class ShelfDailyStatsController < ApplicationController
  before_action :set_shelf_daily_stat, only: %i[ show edit update destroy ]

  # GET /shelf_daily_stats or /shelf_daily_stats.json
  def index
    @shelf_daily_stats = ShelfDailyStat.all
  end

  # GET /shelf_daily_stats/1 or /shelf_daily_stats/1.json
  def show
  end

  # GET /shelf_daily_stats/new
  def new
    @shelf_daily_stat = ShelfDailyStat.new
  end

  # GET /shelf_daily_stats/1/edit
  def edit
  end

  # POST /shelf_daily_stats or /shelf_daily_stats.json
  def create
    @shelf_daily_stat = ShelfDailyStat.new(shelf_daily_stat_params)

    respond_to do |format|
      if @shelf_daily_stat.save
        format.html { redirect_to @shelf_daily_stat, notice: "Shelf daily stat was successfully created." }
        format.json { render :show, status: :created, location: @shelf_daily_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shelf_daily_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelf_daily_stats/1 or /shelf_daily_stats/1.json
  def update
    respond_to do |format|
      if @shelf_daily_stat.update(shelf_daily_stat_params)
        format.html { redirect_to @shelf_daily_stat, notice: "Shelf daily stat was successfully updated." }
        format.json { render :show, status: :ok, location: @shelf_daily_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shelf_daily_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelf_daily_stats/1 or /shelf_daily_stats/1.json
  def destroy
    @shelf_daily_stat.destroy!

    respond_to do |format|
      format.html { redirect_to shelf_daily_stats_path, status: :see_other, notice: "Shelf daily stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf_daily_stat
      @shelf_daily_stat = ShelfDailyStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelf_daily_stat_params
      params.fetch(:shelf_daily_stat, {})
    end
end
