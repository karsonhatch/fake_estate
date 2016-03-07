class HomesController < ApplicationController
	before_action :seller
	before_action :home, only: [:show, :edit, :update, :destroy]

  def index
  	@home = @seller.homes.all
  end

  def show
  end

  def new
  	@home = Home.new 
     
  end

  def create
  	@home = @seller.homes.create(home_params)
  	if @home.save		
  	redirect_to seller_path(@seller)
  	else 
  		render :new
  	end
  end


  def edit
  end

  def update
  	if @seller.home.update(home_params)
  		redirect_to seller_path(@seller)
  	else 
  		render :edit
  	end
  end

  def destroy
  	@home.destroy
  	redirect_to seller_path(@seller)
  end

  private
  def home_params
  	params.require(:home).permit(:bedroom, :bath, :sqft, :style, :story, :sold, :price)
  end

  def home
   @home = @seller.homes.find(params[:id])
  end

  def seller
  	@seller = Seller.find(params[:seller_id])
  end

end
