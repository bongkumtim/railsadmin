class OffersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_offer, only: [:show,:edit, :update, :destroy]

	def show
	end

	def new
		@offer = current_user.offers.build
	end

	def create
		@offer = current_user.offers.build(offer_params)

		respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @offer.update(review_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	@offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

	def set_offer
      @offer = Offer.find(params[:id])
    end
    
    def offer_params
      params.require(:offer).permit(:title, :description, :price, :image, :user_id)
    end
end
