class PortfoliosController < ApplicationController

layout "portfolio"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  
def index
  @page_title = 'Portfolios'
  @subtitle = params[:subtitle]

  if @subtitle == nil
    @portfolio_items = Portfolio.all
  else
	  @portfolio_items = Portfolio.get_by_subtitle(@subtitle)
  end
  
end

def new
	@portfolio_item = Portfolio.new
  3.times { @portfolio_item.technologies.build }
end

  def create
    #@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }        
      end
    end
  end


def edit
	@portfolio_item = Portfolio.find(params[:id])
  3.times { @portfolio_item.technologies.build }
end

  def update
  	@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

def show
	@portfolio_item = Portfolio.find(params[:id])
end

def destroy
	@portfolio_item = Portfolio.find(params[:id])

	@portfolio_item.destroy

	respond_to do |format|
		format.html {redirect_to portfolios_url, notice: 'Portfolios was removed'}
	end
end

private

def portfolio_params
  params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
end

end
