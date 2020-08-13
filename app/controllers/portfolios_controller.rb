class PortfoliosController < ApplicationController
  def index
    @portf_items = Portfolio.all
  end
end
