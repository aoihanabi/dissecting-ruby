class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portf_items = Portfolio.by_position
    puts :notice
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end

  def angular
    @angular_portf_items = Portfolio.angular
  end

  #Renders the view
  def new
    @portf_items = Portfolio.new
  end
  
  #Creates de item into the DB
  def create 
    @portf_items = Portfolio.new(portfolio_params)

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
  end

  #Writes de changes into the DB
  def update 
    respond_to do |format|
      if @portf_items.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Record successfully updated" }
      else
        format.html {render :edit }
      end
    end
  end

  def show
  end

  def destroy
    #Destroy/delete the record
    @portf_items.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed'}
    end
  end

  private 
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      :main_image, 
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end

  def set_portfolio_item
    #This will lookup the object i wanna distroy with the id params
    @portf_items = Portfolio.find(params[:id])
  end
end
