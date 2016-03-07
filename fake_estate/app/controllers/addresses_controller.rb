class AddressesController < ApplicationController
  
  
  # def index
  #   @addresses = Address.all
  # end

  # def show
  #   @seller = Seller.find(params[:seller_id])
  #   @home = @seller.homes.find(params[:home_id])
  #   @address = @home.addresses.find(params[:id])
  # end

  def new
    @home = Home.find(params[:home_id])
    @address = Address.new
  end
  
  def create
    @home = Home.find(params[:home_id])
    @address = Address.new(address_params)
    @address.home_id = params[:home_id]
    if @address.save
      redirect_to seller_home_path(@home.seller, @home)
    else
      render :new
    end
  end

  def edit
    @seller = Seller.find(params[:seller_id])
    @home = @seller.homes.find(params[:home_id])
    @address = @home.address
  end
  
  def update
    @seller = Seller.find(params[:seller_id])
    @home = @seller.homes.find(params[:home_id])
    if @home.address.update(address_params)
      redirect_to seller_home_path(@seller, @home)
    else
      render :edit
    end
  end

  def destroy
    @seller = Seller.find(params[:seller_id])
    @home = @seller.homes.find(params[:home_id])
    @address = @home.address.find(params[:id])
    @address.destroy
    redirect_to seller_home_path(@seller, @home)
    
  end
  
  private
    def address_params
      params.require(:address).permit(:street, :city, :state, :zip)
    end
    



end


