class UsergamesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_usergame, only: [:show, :edit, :update, :destroy]

  # GET /usergames
  # GET /usergames.json
  def index
    @usergames = Usergame.all
  end

  # GET /usergames/1
  # GET /usergames/1.json
  def show
  end

  # GET /usergames/new
  def new
    @usergame = Usergame.new
  end

  # GET /usergames/1/edit
  def edit
  end

  # POST /usergames
  # POST /usergames.json
  def create
    @usergame = Usergame.new(usergame_params)
    require 'base64'
    if @usergame.stat!='game'
      require 'fileutils'
      FileUtils::mkdir_p "#{Rails.root}/public/images/#{@usergame.name}/"
      data = @usergame.ft1
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])
        
        File.open("#{Rails.root}/public/images/#{@usergame.name}/test1.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test1.jpg 134.74.112.32:2501)
      
      data = @usergame.ft2
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test2.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test2.jpg 134.74.112.32:2501)
      
      data = @usergame.ft3
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test3.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test3.jpg 134.74.112.32:2501)

      data = @usergame.ft4
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test4.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test4.jpg 134.74.112.32:2501)

      data = @usergame.ft5
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test5.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test5.jpg 134.74.112.32:2501)

      data = @usergame.ft6
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test6.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test6.jpg 134.74.112.32:2501)

      data = @usergame.ft7
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/#{@usergame.name}/test7.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/#{@usergame.name}/test7.jpg 134.74.112.32:2501)
    end
    if @usergame.stat=='game'
      # if true
      data = @usergame.ft
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

        File.open("#{Rails.root}/public/images/test.jpg", 'wb') do |f|
          f.write image_data
        end
        %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/test.jpgADD#{@usergame.name} 134.74.112.32:2502)
        
        
    end

    file=File.read('/home/wei/Documents/pythontool/ownft.json')
        h=JSON.parse(file)  
        @usergame.attributes={angry:h["Angry"], disgust:h["Disgust"], fear:h["Fear"], happy: h["Happy"], neutral:h["Neutral"], sad:h["Sad"], surprise:h["Surprise"]}


    respond_to do |format|
      # if @usergame.save
        format.html { redirect_to usergames_url, notice: 'Usergame was successfully created.' }
        format.json { render :show, status: :created, location: @usergame }
        format.js
      # else
      #   format.html { render :new }
      #   format.json { render json: @usergame.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /usergames/1
  # PATCH/PUT /usergames/1.json
  def update
    respond_to do |format|
      if @usergame.update(usergame_params)
        format.html { redirect_to @usergame, notice: 'Usergame was successfully updated.' }
        format.json { render :show, status: :ok, location: @usergame }
      else
        format.html { render :edit }
        format.json { render json: @usergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usergames/1
  # DELETE /usergames/1.json
  def destroy
    @usergame.destroy
    respond_to do |format|
      format.html { redirect_to usergames_url, notice: 'Usergame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usergame
      @usergame = Usergame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usergame_params
      params.require(:usergame).permit(:name, :email, :score, :rank, :ft1,:ft2,:ft3,:ft4,:ft5,:ft6,:ft7,:ft,:stat)
    end
end
