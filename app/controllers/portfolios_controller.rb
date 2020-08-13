class PortfoliosController < ApplicationController
  def index
    @portf_items = Portfolio.all
  end

  #Renders the view
  def new
    @portf_items = Portfolio.new
  end

  def create 
    @portf_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portf_items.save
        format.html{redirect_to portfolios_path, notice: "Your Portfolio has been created successfully"}
      else
        format.html { render :new }
      end
    end
  end

end
