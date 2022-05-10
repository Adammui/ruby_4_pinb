class AdvertisementsController < ApplicationController
  #before_action :set_advertisement, only: %i[ show edit update destroy ]
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :authenticate, :require_authentication, except: :index
  load_and_authorize_resource except: :index
  # GET /advertisements or /advertisements.json
  def index 
    @users = User.all
    if params[:term]
      @advertisements = Advertisement.search_by_adv(params[:term]).with_pg_search_highlight
    else
      @advertisements = Advertisement.all
    end
  end

  # GET /advertisements/1 or /advertisements/1.json
  def show
  end

  # GET /advertisements/new
  def new
    #@advertisement = Advertisement.new
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements or /advertisements.json
  def create
    #@advertisement = Advertisement.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: "Advertisement was successfully created." }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1 or /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: "Advertisement was successfully updated." }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1 or /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: "Advertisement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_api
    respond_to do |format|
      @advertisement = Advertisement.new(advertisement_params)
      if @advertisement.save
        format.json { render json: @advertisement }
      else
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end
  def update_api
    respond_to do |format|
      @advertisement = Advertisement.find_by id: params[:id]
      if @advertisement.update(advertisement_params)
        format.json { render json:@advertisement }
      else
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end

  end
  def destroy_api
    @advertisement = Advertisement.find_by id: params[:id]
    if @advertisement.destroy
    respond_to do |format|
      format.json { render json:{status: 'success' } }
    end
    else
      respond_to do |format|
        format.json { render json:{status: 'error' } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  # def set_advertisement
  #   @advertisement = Advertisement.find(params[:id])
  # end

    # Only allow a list of trusted parameters through.
    def advertisement_params
      params.require(:advertisement).permit(:user_id, :text, {:image=>[:url]})
    end
end
