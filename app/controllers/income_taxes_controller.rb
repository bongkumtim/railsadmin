class IncomeTaxesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_income, only: [:show,:edit, :update, :destroy]



	def index
		@incomes = IncomeTax.where(user_id: current_user).paginate(:page => params[:page], :per_page => 6)
	end

	def show
	end

	def new
		@income = current_user.income_taxes.build
	end

	def create
		@income = current_user.income_taxes.build(income_params)

		respond_to do |format|
      if @income.save
        format.html { redirect_to income_tax_path(@income), notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: income_path }
      else
        format.html { render :new }
        format.json { render json: income_path.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @incometaxes, notice: 'Income Tax receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @incometaxes }
      else
        format.html { render :edit }
        format.json { render json: @incometaxes.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	@income.destroy
    respond_to do |format|
      format.html { redirect_to income_path, notice: 'Income tax receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

	def set_income
      @income = IncomeTax.find(params[:id])
    end
    
    def income_params
      params.require(:income_tax).permit(:title, :description, :amount, :image, :user_id)
    end

end
