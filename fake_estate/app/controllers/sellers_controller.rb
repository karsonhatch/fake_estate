class SellersController < ApplicationController
	before_action :seller, only: [:show, :edit, :update, :destroy]

  def index
  	@sellers = Seller.all
  end

  def show
     @home = @seller.homes.find(params[:id])
     @address = @home.address
  end

  def new
  	@seller = Seller.new
  end

  def create
  	@seller = Seller.create(seller_params)
  	if @seller.save
  	redirect_to sellers_path
	else 
	render :new
	end
  end

  def edit
  end

  def update
  	if @seller.update(seller_params)
  		redirect_to seller_path(@seller)
  	else
  		render :edit
  	end
  end

  def destroy
  	@seller.destroy
  	redirect_to sellers_path
  end

	private

	def seller_params
		params.require(:seller).permit(:name, :phone, :email)
	end

	def seller
		@seller = Seller.find(params[:id])
	end
end
