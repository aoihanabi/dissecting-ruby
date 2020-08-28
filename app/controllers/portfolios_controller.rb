class PortfoliosController < ApplicationController
  def index
    @portf_items = Portfolio.all
  end

  def angular
    @angular_portf_items = Portfolio.angular
  end

  #Renders the view
  def new
    @portf_items = Portfolio.new
    3.times {@portf_items.technologies.build}
  end
  #Creates de item into the DB
  def create 
    @portf_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portf_items.save
        format.html{redirect_to portfolios_path, notice: "Your Portfolio has been created successfully"}
      else
        format.html { render :new }
      end
    end
  end

  #Renders the view for the specified item and puts all
  #the info inside the fields to be edited
  def edit
    @portf_items = Portfolio.find(params[:id])
  end
  #Writes de changes into the DB
  def update 
    @portf_items = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portf_items.update(params.require(:portfolio).permit(:title,:subtitle,:body))
        format.html { redirect_to portfolios_path, notice: "Record successfully updated" }
      else
        format.html {render :edit }
      end
    end
  end

  def show
    @portf_items = Portfolio.find(params[:id])
  end

  def destroy
    #This will lookup the object i wanna distroy with the id params
    @portf_items = Portfolio.find(params[:id])
    #Destroy/delete the record
    @portf_items.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed'}
    end
  end
end
