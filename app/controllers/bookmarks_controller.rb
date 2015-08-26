class BookmarksController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  #has_attached_file :photo
  # GET /bookmarks
  # GET /bookmarks.json
  log=Logger.new(STDOUT)
  def index
    @bookmarks = Bookmark.all
    @thiselment=Bookmark.last
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    @bookmark=Bookmark.last
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  def realrender
    render :realrender
  end
  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    # %x(python /home/wei/Documents/pythontool/emopred.py #{@bookmark.photo.path})
    require 'base64'

    data = @bookmark.canv
    #// remove all extras except data
    
      # image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

      # File.open("#{Rails.root}/public/images/test.jpg", 'wb') do |f|
      #   f.write image_data
      # end
    
    respond_to do |format|
      if @bookmark.save
      #if true
        
        # impath=@bookmark.photo.path
        # if !@bookmark.photo_content_type
        # %x(curl --data  /home/wei/Documents/RubyRails/bookmarks/public/images/test.jpg 134.74.112.32:2500) 
        # end
        # if data==''
        #if @bookmark.photo_content_type
        %x(curl --data  #{@bookmark.photo.path} 134.74.112.32:2500)
        #end
        # end
        #log.info('python cimputing  score: #{sc}')
        file=File.read('/home/wei/Documents/pythontool/data.json')
        h=JSON.parse(file)
        @bookmark.attributes={angry:h["Angry"], disgust:h["Disgust"], fear:h["Fear"], happy: h["Happy"], neutral:h["Neutral"], sad:h["Sad"], surprise:h["Surprise"]}
        Bookmark.last.update(angry:h["Angry"])
        Bookmark.last.update(disgust:h["Disgust"])
        Bookmark.last.update(fear:h["Fear"])
        Bookmark.last.update(happy: h["Happy"])
        Bookmark.last.update(neutral:h["Neutral"])
        Bookmark.last.update(sad:h["Sad"])
        Bookmark.last.update(surprise:h["Surprise"])
        format.html { redirect_to @bookmark, notice: 'Emotion was successfully computed.' }
        format.json { render :show, status: :created, happy: @bookmark }
    

      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def cam
    render 'cam'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      #@bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title,:url,:photo,:canv)
    end
end
