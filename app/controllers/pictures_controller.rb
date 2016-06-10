  class PicturesController < ApplicationController

  def index

    @listing = Listing.find(params[:id])

    @pictures = @listing.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @listing = Listing.find(params[:listing_id])
    @picture = @listing.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@gallery = Gallery.find(params[:gallery_id])

    @picture = Picture.find(params[:id])

    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    # @listing = Listing.find(params[:listing_id])

    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to "/"
    else
      render :edit
    end
    
     
  end
  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@gallery = Gallery.find(params[:gallery_id])
    #@picture = @gallery.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @listing = Listing.find(params[:listing_id])

    @listing.cover = @picture.id
    @listing.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :listing_id, :image)
  end
end