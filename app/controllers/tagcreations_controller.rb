class TagcreationsController < ApplicationController
  before_action :set_tagcreation, only: [:show, :edit, :update, :destroy]

  # GET /tagcreations
  # GET /tagcreations.json
  def index
    @tagcreations = Tagcreation.paginate(page: params[:page], per_page: 6)    
  end

  # GET /tagcreations/1
  # GET /tagcreations/1.json
  def show
  end

  # GET /tagcreations/new
  def new
    @tagcreation = Tagcreation.new
  end

  # GET /tagcreations/1/edit
  def edit
  end

  # POST /tagcreations
  # POST /tagcreations.json
  def create
    @tagcreation = Tagcreation.new(tagcreation_params)

    respond_to do |format|
      if @tagcreation.save
        format.html { redirect_to @tagcreation, notice: 'Tagcreation was successfully created.' }
        format.json { render :show, status: :created, location: @tagcreation }
      else
        format.html { render :new }
        format.json { render json: @tagcreation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tagcreations/1
  # PATCH/PUT /tagcreations/1.json
  def update
    respond_to do |format|
      if @tagcreation.update(tagcreation_params)
        format.html { redirect_to @tagcreation, notice: 'Tagcreation was successfully updated.' }
        format.json { render :show, status: :ok, location: @tagcreation }
      else
        format.html { render :edit }
        format.json { render json: @tagcreation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tagcreations/1
  # DELETE /tagcreations/1.json
  def destroy
    @tagcreation.destroy
    respond_to do |format|
      format.html { redirect_to tagcreations_url, notice: 'Tagcreation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

#Export the tag creation template for vendor
  def export
  workbook = RubyXL::Workbook.new
  worksheet = workbook.add_worksheet('Sheet')
  worksheet.sheet_name = 'CustomTag'
  worksheet.add_cell(0, 0, 'ProductTitle')
 # worksheet.sheet_data[0][0].change_font_bold(true)
  worksheet.add_cell(0, 1, 'Product Option1') 
 # worksheet.sheet_data[0][1].change_font_bold(true) 
  worksheet.add_cell(0, 2, 'ProductValue1') 
  #worksheet.sheet_data[0][3].change_font_bold(true)
   worksheet.add_cell(0, 3, 'Product Option2') 
 # worksheet.sheet_data[0][1].change_font_bold(true) 
  worksheet.add_cell(0, 4, 'ProductValue2') 
  #worksheet.sheet_data[0][3].change_font_bold(true)
   worksheet.add_cell(0, 5, 'Product Option3') 
 # worksheet.sheet_data[0][1].change_font_bold(true) 
  worksheet.add_cell(0, 6, 'ProductValue3') 
  #worksheet.sheet_data[0][3].change_font_bold(true)
  worksheet.add_cell(0, 7, 'ProductTag') 
  #worksheet.sheet_data[0][5].change_font_bold(true)
  workbook.worksheets.delete(workbook['Sheet1'])
  send_data workbook.stream.string, filename: "customtag.xlsx", disposition: 'attachment', type: 'application/excel'
  end


  #to import the tags from user
def import
   file = params[:file]
  begin
    file_ext = File.extname(file.original_filename)
   # raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
    spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
    #header = spreadsheet.row(1)
    ## We are iterating from row 2 because we have left row one for header
    (2..spreadsheet.last_row).each do |i|
         Tagcreation.create(producttitle: spreadsheet.cell(i,1), productoption: spreadsheet.cell(i,2), 
          productvalue: spreadsheet.cell(i,3), productoption1: spreadsheet.cell(i,4), 
          productvalue1: spreadsheet.cell(i,5), productoption2: spreadsheet.cell(i,6),
           productvalue2: spreadsheet.cell(i,7),  producttag: spreadsheet.cell(i,8))
    end
    flash[:notice] = "Records Imported" 
    respond_to do |format|
      format.html { redirect_to tagcreations_url, notice: 'Tagcreation was  Imported.' }
      format.json { head :no_content }
    end          

  end
 end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tagcreation
      @tagcreation = Tagcreation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tagcreation_params
      params.require(:tagcreation).permit(:producttitle, :productoption, :productvalue, :productoption1, :productvalue1, :productoption2, :productvalue2, :producttagid, :producttag)
    end
end
