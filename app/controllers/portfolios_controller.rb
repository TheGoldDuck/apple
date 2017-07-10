class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'

  def index                          # Gets Portfolio items
    @portfolio_items = Portfolio.all # Can specify what to display on page
  end
  # Demonstration Purposes
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    # Creates three types of 'technologies', available to form
    3.times { @portfolio_item.technologies.build }
  end

  def create
   @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :image,
                                      technologies_attributes: [:name]
                                     )
  end
  def set_portfolio_item
        # Preform the lookup
        @portfolio_item = Portfolio.find(params[:id])
  end
end
