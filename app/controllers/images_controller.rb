class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.where(homepage: true).order(updated_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  def admin_index
    @images = Image.order(created_at: :desc).paginate(:page => params[:page], :per_page => 30)
  end
  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.ip = ip2long request.remote_ip
    @image.delete_code = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @image.homepage = false
    @image.save
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
  end

  def homepage_toggle
    @image = Image.find(params[:id])
    @image.homepage = !@image.homepage
    @image.save
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image, :title, :delete_code, :homepage)
    end
end
