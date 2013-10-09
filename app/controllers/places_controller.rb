class PlacesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /last_update.json
  def last_update
    @last_update = Settings.places_last_update

    render json: {:last_update => @last_update}
  end

  # GET /places
  # GET /places.json
  def index
    @places = Place.all

    @last_update = Settings.places_last_update

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(params[:place])

    @saved = @place.save

    if @saved then Setting.places_last_update = Time.now.to_i end

    respond_to do |format|
      if @saved
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id])

    @updated = @place.update_attributes(params[:place])

    if @updated then Settings.places_last_update = Time.now.to_i end

    respond_to do |format|
      if @updated 
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    Settings.places_last_update = Time.now.to_i

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
end
