class ListsController < ApplicationController
  before_action :authenticate_user!, except: :welcome
  before_action :set_list, only: [:show, :edit, :update, :destroy]


  def welcome
  end

  def index
    @lists = List.all.order("created_at DESC")
    @accounts = Account.where(user_id: current_user)
    @total_cash = @accounts.pluck(:cash_collection_amount).compact.sum + @accounts.pluck(:opening_cash).compact.sum - @accounts.pluck(:cash_purchase_amount).compact.sum - @accounts.pluck(:payment_creditor_cash_amount).compact.sum - @accounts.pluck(:recurring_payment_amount).compact.sum - @accounts.pluck(:asset_purchase_cash_amount).compact.sum
    @total_bank = @accounts.pluck(:card_collection_amount).compact.sum + @accounts.pluck(:fpx_collection_amount).compact.sum + @accounts.pluck(:bank_transfer_amount).compact.sum + @accounts.pluck(:opening_bank).compact.sum - @accounts.pluck(:payment_creditor_bank_amount).compact.sum - @accounts.pluck(:recurring_payment_bank_amount).compact.sum - @accounts.pluck(:asset_purchase_bank_amount).compact.sum
    @total_sales = @accounts.pluck(:cash_collection_amount).compact.sum + @accounts.pluck(:card_collection_amount).compact.sum + @accounts.pluck(:fpx_collection_amount).compact.sum + @accounts.pluck(:bank_transfer_amount).compact.sum
  end


  def show
     @user = User.all
     @reviews = Review.where(list_id: @list.id).order("created_at DESC")
     if @reviews.blank?
      @avg = 0
    else
      @avg = @reviews.average(:rating)
    end
  end

  
  def new
    @list = current_user.lists.build
  end

  
  def edit
  end

  
  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_list
      @list = List.find(params[:id])
    end
    
    def list_params
      params.require(:list).permit(:title, :description, :price, :image)
    end
end
