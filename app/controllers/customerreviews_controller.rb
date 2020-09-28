class CustomerreviewsController < ApplicationController
  before_action :set_customerreview, only: [:show, :edit, :update, :destroy]
  # GET /customerreviews
  # GET /customerreviews.json
  def index
   
    @tagcreations = Tagcreation.paginate(page: params[:page], per_page: 6)    
     if params[:search]
      @search_term = params[:search]
      @tagcreations =@tagcreations.search_by(@search_term)
    end
  end

  # GET /customerreviews/1
  # GET /customerreviews/1.json
  def show
  end

  # GET /customerreviews/new
  def new
    @customerreview = Customerreview.new()
    @customerreview.Customerreviewtags.build
     @tagcreations = Tagcreation.where(id:15)
   end

  # GET /customerreviews/1/edit
  def edit
  end

  # POST /customerreviews
  # POST /customerreviews.json
  def create
    @customerreview = Customerreview.new(customerreview_params)
    respond_to do |format|
      if @customerreview.save
        format.html { redirect_to @customerreview, notice: 'Customerreview was successfully created.' }
        format.json { render :index, status: :created, location: @customerreview }
      else
        format.html { render :new }
        format.json { render json: @customerreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customerreviews/1
  # PATCH/PUT /customerreviews/1.json
  def update
    respond_to do |format|
      if @customerreview.update(customerreview_params)
        format.html { redirect_to @customerreview, notice: 'Customerreview was successfully updated.' }
        format.json { render :index, status: :ok, location: @customerreview }
      else
        format.html { render :edit }
        format.json { render json: @customerreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customerreviews/1
  # DELETE /customerreviews/1.json
  def destroy
    @customerreview.destroy
   
    respond_to do |format|
      format.html { redirect_to customerreviews_url, notice: 'Customerreview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customerreview
      @customerreview = Customerreview.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def customerreview_params
      params.require(:customerreview).permit(:customertype, :customername, :customeremail, :reviewrating, :reviewbody, :publish, :productid, :reviewid, customerreviewtags_attributes: [:producttag])
    end
end
