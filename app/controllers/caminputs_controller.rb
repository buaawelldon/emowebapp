class CaminputsController < ApplicationController
  before_action :set_caminput, only: [:show, :edit, :update, :destroy]

  # GET /caminputs
  # GET /caminputs.json
  def index
    @caminputs = Caminput.all
  end

  # GET /caminputs/1
  # GET /caminputs/1.json
  def show
  end

  # GET /caminputs/new
  def new
    @caminput = Caminput.new
  end

  # GET /caminputs/1/edit
  def edit
  end

  # POST /caminputs
  # POST /caminputs.json
  def create
    @caminput = Caminput.new(caminput_params)

    respond_to do |format|
      if @caminput.save
        format.html { redirect_to @caminput, notice: 'Caminput was successfully created.' }
        format.json { render :show, status: :created, location: @caminput }
      else
        format.html { render :new }
        format.json { render json: @caminput.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caminputs/1
  # PATCH/PUT /caminputs/1.json
  def update
    respond_to do |format|
      if @caminput.update(caminput_params)
        format.html { redirect_to @caminput, notice: 'Caminput was successfully updated.' }
        format.json { render :show, status: :ok, location: @caminput }
      else
        format.html { render :edit }
        format.json { render json: @caminput.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caminputs/1
  # DELETE /caminputs/1.json
  def destroy
    @caminput.destroy
    respond_to do |format|
      format.html { redirect_to caminputs_url, notice: 'Caminput was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caminput
      @caminput = Caminput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caminput_params
      params.require(:caminput).permit(:username, :type)
    end
end
