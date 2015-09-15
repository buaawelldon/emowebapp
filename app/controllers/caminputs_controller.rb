class CaminputsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_caminput, only: [:show, :edit, :update, :destroy]

  # GET /caminputs
  # GET /caminputs.json
  def index
    @caminputs = Caminput.all
    @thiselment=Caminput.last
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


    require 'base64'

    data = @caminput.canv
    #// remove all extras except data
    
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

      File.open("#{Rails.root}/public/images/test.jpg", 'wb') do |f|
        f.write image_data
      end

      %x(curl --data  #{Rails.root}/public/images/test.jpg 134.74.112.32:2500) 

      file=File.read('/home/wei/Documents/pythontool/data.json')
        h=JSON.parse(file)


    respond_to do |format|
      #if @caminput.save

        @caminput.attributes={angry:h["Angry"], disgust:h["Disgust"], fear:h["Fear"], happy: h["Happy"], neutral:h["Neutral"], sad:h["Sad"], surprise:h["Surprise"]}
        # Caminput.last.update(angry:h["Angry"])
        # Caminput.last.update(disgust:h["Disgust"])
        # Caminput.last.update(fear:h["Fear"])
        # Caminput.last.update(happy: h["Happy"])
        # Caminput.last.update(neutral:h["Neutral"])
        # Caminput.last.update(sad:h["Sad"])
        # Caminput.last.update(surprise:h["Surprise"])
        #format.html 
        format.html { redirect_to new_caminput_url, notice: 'Caminput was successfully created.' }
        format.json { render :show, status: :created, location: @caminput }
        format.js
      # else
      #   format.html { render :new }
      #   format.json { render json: @caminput.errors, status: :unprocessable_entity }
      # end
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
      params.require(:caminput).permit(:username, :type,:canv)
    end
end
