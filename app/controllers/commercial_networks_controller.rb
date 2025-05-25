class CommercialNetworksController < ApplicationController
  before_action :set_commercial_network, only: %i[ show edit update destroy ]

  # GET /commercial_networks or /commercial_networks.json
  def index
    @commercial_networks = CommercialNetwork.all
  end

  # GET /commercial_networks/1 or /commercial_networks/1.json
  def show
  end

  # GET /commercial_networks/new
  def new
    @commercial_network = CommercialNetwork.new
  end

  # GET /commercial_networks/1/edit
  def edit
  end

  # POST /commercial_networks or /commercial_networks.json
  def create
    @commercial_network = CommercialNetwork.new(commercial_network_params)

    respond_to do |format|
      if @commercial_network.save
        format.html { redirect_to @commercial_network, notice: "Commercial network was successfully created." }
        format.json { render :show, status: :created, location: @commercial_network }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commercial_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commercial_networks/1 or /commercial_networks/1.json
  def update
    respond_to do |format|
      if @commercial_network.update(commercial_network_params)
        format.html { redirect_to @commercial_network, notice: "Commercial network was successfully updated." }
        format.json { render :show, status: :ok, location: @commercial_network }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commercial_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commercial_networks/1 or /commercial_networks/1.json
  def destroy
    @commercial_network.destroy!

    respond_to do |format|
      format.html { redirect_to commercial_networks_path, status: :see_other, notice: "Commercial network was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commercial_network
      @commercial_network = CommercialNetwork.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commercial_network_params
      params.fetch(:commercial_network, {})
    end
end
