class ProductlistsController < ApplicationController
  before_action :set_productlist, only: [:show, :edit, :update, :destroy]

  # GET /productlists
  # GET /productlists.json
  def index
    @productlists = Productlist.all
  end

  # GET /productlists/1
  # GET /productlists/1.json
  def show
  end

  # GET /productlists/new
  def new
    @productlist = Productlist.new
  end

  # GET /productlists/1/edit
  def edit
  end

  # POST /productlists
  # POST /productlists.json
  def create
    @productlist = Productlist.new(productlist_params)

    respond_to do |format|
      if @productlist.save
        format.html { redirect_to @productlist, notice: 'Productlist was successfully created.' }
        format.json { render :show, status: :created, location: @productlist }
      else
        format.html { render :new }
        format.json { render json: @productlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productlists/1
  # PATCH/PUT /productlists/1.json
  def update
    respond_to do |format|
      if @productlist.update(productlist_params)
        format.html { redirect_to @productlist, notice: 'Productlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @productlist }
      else
        format.html { render :edit }
        format.json { render json: @productlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productlists/1
  # DELETE /productlists/1.json
  def destroy
    @productlist.destroy
    respond_to do |format|
      format.html { redirect_to productlists_url, notice: 'Productlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productlist
      @productlist = Productlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def productlist_params
      params.require(:productlist).permit(:title, :body, :option1, :option2, :option3, :option1val, :option2val, :option3val)
    end
end
