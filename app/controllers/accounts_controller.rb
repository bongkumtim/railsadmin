class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]


  def index
    @accounts = Account.where(user_id: current_user)
  end


  def show
  end

  def new
    @account = current_user.accounts.build
  end


  def edit
  end


  def create
    @account = current_user.accounts.build(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def cos
    @accounts = Account.where(user_id: current_user)
    @total_purchase = @accounts.map(&:cash_purchase_amount).compact.sum + @accounts.map(&:credit_purchase_amount).compact.sum
    @total_sales = @accounts.map(&:cash_collection_amount).compact.sum + @accounts.map(&:card_collection_amount).compact.sum + @accounts.map(&:fpx_collection_amount).compact.sum + @accounts.map(&:bank_transfer_amount).compact.sum
  end

  def opening_cash
    @account = current_user.accounts.build
  end

  def opening_bank
    @account = current_user.accounts.build
  end

  def cash_purchase
    @account = current_user.accounts.build
  end

  def credit_purchase
    @account = current_user.accounts.build
  end

  def cash_collection
    @account = current_user.accounts.build
  end

  def payment_cash
    @account = current_user.accounts.build
  end

  def payment_bank
    @account = current_user.accounts.build
  end

  def card_collection
    @account = current_user.accounts.build
  end

  def fpx_collection
    @account = current_user.accounts.build
  end

  def bank_transfer
    @account = current_user.accounts.build
  end

  def cash_ca
    @accounts = Account.where(user_id: current_user)
    @total_cash = @accounts.map(&:cash_collection_amount).compact.sum + @accounts.map(&:opening_cash).compact.sum - (@accounts.map(&:cash_purchase_amount).compact.sum +@accounts.map(&:payment_creditor_cash_amount).compact.sum)
    @total_bank = @accounts.map(&:card_collection_amount).compact.sum + @accounts.map(&:fpx_collection_amount).compact.sum + @accounts.map(&:bank_transfer_amount).compact.sum + @accounts.map(&:opening_bank).compact.sum - @accounts.map(&:payment_creditor_bank_amount).compact.sum
  end

  def trade_creditor
    @accounts = Account.where(user_id: current_user)
    @total_trade = @accounts.map(&:credit_purchase_amount).compact.sum - (@accounts.map(&:payment_creditor_bank_amount).compact.sum +@accounts.map(&:payment_creditor_cash_amount).compact.sum)
  end

  

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:open_cash_description, :opening_cash, :opening_bank, :user_id, :bank, :image, :cash_collection_amount, :cash_collection_description, :cash_purchase_amount, :cash_purchase_description, :credit_purchase_amount, :credit_purchase_description, :creditor_name, :payment_creditor_cash_amount, :payment_creditor_cash_description, :payment_creditor_bank_amount, :payment_creditor_bank_description, :card_collection_amount, :card_collection_description, :card_charges, :bank_transfer_amount, :bank_transfer_description, :fpx_collection_amount, :fpx_collection_description, :fpx_charges)
    end
end
