class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_all, only: [:new, :opening_cash, :opening_bank, :cash_purchase, :credit_purchase, :cash_collection, :payment_cash, :payment_bank, :card_collection, :fpx_collection, :bank_transfer]
  before_action :find_user, only: [:index, :cos, :cash_ca, :trade_creditor, :demon]

  def index
  end


  def show
  end

  def new
  end


  def edit
  end


  def create
    @account = current_user.accounts.build(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to cash_ca_path, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: cash_ca_path}
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def cos
    @total_purchase = @accounts.map(&:cash_purchase_amount).compact.sum + @accounts.map(&:credit_purchase_amount).compact.sum
    @total_sales = @accounts.map(&:cash_collection_amount).compact.sum + @accounts.map(&:card_collection_amount).compact.sum + @accounts.map(&:fpx_collection_amount).compact.sum + @accounts.map(&:bank_transfer_amount).compact.sum
  end

  def demon
  end

  def opening_cash
  end

  def opening_bank
  end

  def cash_purchase
  end

  def credit_purchase
  end

  def cash_collection
  end

  def payment_cash
  end

  def payment_bank
  end

  def card_collection
  end

  def fpx_collection
  end

  def bank_transfer
  end

  def cash_ca
    @total_cash = @accounts.pluck(:cash_collection_amount).compact.sum + @accounts.pluck(:opening_cash).compact.sum - (@accounts.pluck(:cash_purchase_amount).compact.sum +@accounts.pluck(:payment_creditor_cash_amount).compact.sum)
    @total_bank = @accounts.map(&:card_collection_amount).compact.sum + @accounts.map(&:fpx_collection_amount).compact.sum + @accounts.map(&:bank_transfer_amount).compact.sum + @accounts.map(&:opening_bank).compact.sum - @accounts.map(&:payment_creditor_bank_amount).compact.sum
  end

  def trade_creditor
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

    def find_user
      @accounts = Account.where(user_id: current_user)
    end

    def set_all
      @account = current_user.accounts.build
    end
 
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:open_cash_description, :opening_cash, :opening_bank, :user_id, :bank, :image, :cash_collection_amount, :cash_collection_description, :cash_purchase_amount, :cash_purchase_description, :credit_purchase_amount, :credit_purchase_description, :creditor_name, :payment_creditor_cash_amount, :payment_creditor_cash_description, :payment_creditor_bank_amount, :payment_creditor_bank_description, :card_collection_amount, :card_collection_description, :card_charges, :bank_transfer_amount, :bank_transfer_description, :fpx_collection_amount, :fpx_collection_description, :fpx_charges)
    end
end
