class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_all, only: [:closing, :asset_purchase_cash, :asset_purchase_bank, :asset_purchase_loan, :generate, :recurring_payment_bank, :recurring_payment_cash, :new, :opening_cash, :opening_bank, :cash_purchase, :credit_purchase, :cash_collection, :payment_cash, :payment_bank, :card_collection, :fpx_collection, :bank_transfer]
  before_action :find_user, only: [:index, :cos, :cash_ca, :trade_creditor, :generate]
  before_action :summary, only: [:cos, :cash_ca, :trade_creditor, :generate]

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
    @purchase = @accounts.where.not(cash_purchase_amount: nil).or(@accounts.where.not(credit_purchase_amount: nil))
    @sales = @accounts.where.not(cash_collection_amount: nil).or(@accounts.where.not(fpx_collection_amount: nil)).or(@accounts.where.not(card_collection_amount: nil)).or(@accounts.where.not(bank_transfer_amount: nil))
  end

  def generate
    @total_inventory = @accounts.pluck(:closing_inventory).compact.sum

    @phone = @accounts.where(recurring_payment: 'Telephone Bill')
    @phone2= @accounts.where(recurring_payment_bank: 'Telephone Bill')
    @total_phone = @phone.pluck(:recurring_payment_amount).compact.sum + @phone2.pluck(:recurring_payment_bank_amount).compact.sum

    @salary = @accounts.where(recurring_payment: 'Salary')
    @salary2= @accounts.where(recurring_payment_bank: 'Salary')
    @total_salary = @salary.pluck(:recurring_payment_amount).compact.sum + @salary2.pluck(:recurring_payment_bank_amount).compact.sum

    @epf = @accounts.where(recurring_payment: 'Staff EPF')
    @epf2= @accounts.where(recurring_payment_bank: 'Staff EPF')
    @total_epf = @epf.pluck(:recurring_payment_amount).compact.sum + @epf2.pluck(:recurring_payment_bank_amount).compact.sum

    @socso = @accounts.where(recurring_payment: 'Staff Socso')
    @socso2= @accounts.where(recurring_payment_bank: 'Staff Socso')
    @total_socso = @socso.pluck(:recurring_payment_amount).compact.sum + @socso2.pluck(:recurring_payment_bank_amount).compact.sum

    @wages = @accounts.where(recurring_payment: "Part time Wages")
    @wages2= @accounts.where(recurring_payment_bank: "Part time Wages")
    @total_wages = @wages.pluck(:recurring_payment_amount).compact.sum + @wages2.pluck(:recurring_payment_bank_amount).compact.sum

    @rental = @accounts.where(recurring_payment: 'Rental')
    @rental2= @accounts.where(recurring_payment_bank: 'Rental')
    @total_rental = @rental.pluck(:recurring_payment_amount).compact.sum + @rental2.pluck(:recurring_payment_bank_amount).compact.sum

    @petrol = @accounts.where(recurring_payment: 'Petrol Claim')
    @petrol2= @accounts.where(recurring_payment_bank: 'Petrol Claim')
    @total_petrol = @petrol.pluck(:recurring_payment_amount).compact.sum + @petrol2.pluck(:recurring_payment_bank_amount).compact.sum

    @electric = @accounts.where(recurring_payment: 'Electric Bill')
    @electric2= @accounts.where(recurring_payment_bank: 'Electric Bill')
    @total_electric = @electric.pluck(:recurring_payment_amount).compact.sum + @electric2.pluck(:recurring_payment_bank_amount).compact.sum

    @water = @accounts.where(recurring_payment: 'Water Bill')
    @water2= @accounts.where(recurring_payment_bank: 'Water Bill')
    @total_water = @water.pluck(:recurring_payment_amount).compact.sum + @water2.pluck(:recurring_payment_bank_amount).compact.sum

    @other = @accounts.where(recurring_payment: 'Other')
    @other2= @accounts.where(recurring_payment_bank: 'Other')
    @total_other = @other.pluck(:recurring_payment_amount).compact.sum + @other2.pluck(:recurring_payment_bank_amount).compact.sum

    @drawing = @accounts.where(recurring_payment: 'Director Drawing')
    @draw = @accounts.where(recurring_payment_bank: 'Director Drawing')
    @total_drawing = @drawing.pluck(:recurring_payment_amount).compact.sum + @draw.pluck(:recurring_payment_bank_amount).compact.sum
    
    @total_one = @total_inventory + @total_cash + @total_bank + @total_asset
    @total_two = @total_one - @total_trade
    @net_profit = @total_two - @capital
    @total_bs = @net_profit - @total_drawing
    @gross_profit = @total_sales -  @total_purchase
    @total_expenses = @total_phone + @total_salary + @total_epf + @total_socso + @total_wages + @total_rental + @total_petrol + @total_electric + @total_water + @total_other + @total_drawing
    @net_profit_two = @gross_profit - @total_expenses + @total_inventory
  end

  def closing
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

  def recurring_payment_bank
  end

  def recurring_payment_cash
  end

  def asset_purchase_cash
  end

  def asset_purchase_bank
  end

  def asset_purchase_loan
  end

  def cash_ca
     @account_cash = @accounts.where.not(opening_cash: nil).or(@accounts.where.not(cash_collection_amount: nil)).or(@accounts.where.not(payment_creditor_cash_amount: nil)).or(@accounts.where.not(asset_purchase_cash_amount: nil)).or(@accounts.where.not(recurring_payment_amount: nil)).or(@accounts.where.not(cash_purchase_amount: nil))
     @account_bank = @accounts.where.not(opening_bank: nil).or(@accounts.where.not(card_collection_amount: nil)).or(@accounts.where.not(payment_creditor_bank_amount: nil)).or(@accounts.where.not(asset_purchase_bank_amount: nil)).or(@accounts.where.not(recurring_payment_bank_amount: nil)).or(@accounts.where.not(bank_transfer_amount: nil)).or(@accounts.where.not(fpx_collection_amount: nil))
  end

  def trade_creditor
    @account = @accounts.where.not(credit_purchase_amount: nil)  
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

    def summary

      @total_asset = @accounts.pluck(:asset_purchase_cash_amount).compact.sum + @accounts.pluck(:asset_purchase_bank_amount).compact.sum
      @total_cash = @accounts.pluck(:cash_collection_amount).compact.sum + @accounts.pluck(:opening_cash).compact.sum - @accounts.pluck(:cash_purchase_amount).compact.sum - @accounts.pluck(:payment_creditor_cash_amount).compact.sum - @accounts.pluck(:recurring_payment_amount).compact.sum - @accounts.pluck(:asset_purchase_cash_amount).compact.sum
      @total_bank = @accounts.pluck(:card_collection_amount).compact.sum + @accounts.pluck(:fpx_collection_amount).compact.sum + @accounts.pluck(:bank_transfer_amount).compact.sum + @accounts.pluck(:opening_bank).compact.sum - @accounts.pluck(:payment_creditor_bank_amount).compact.sum - @accounts.pluck(:recurring_payment_bank_amount).compact.sum - @accounts.pluck(:asset_purchase_bank_amount).compact.sum
      @total_purchase = @accounts.pluck(:cash_purchase_amount).compact.sum + @accounts.pluck(:credit_purchase_amount).compact.sum
      @total_sales = @accounts.pluck(:cash_collection_amount).compact.sum + @accounts.pluck(:card_collection_amount).compact.sum + @accounts.pluck(:fpx_collection_amount).compact.sum + @accounts.pluck(:bank_transfer_amount).compact.sum
      @total_trade = @accounts.pluck(:credit_purchase_amount).compact.sum - (@accounts.pluck(:payment_creditor_bank_amount).compact.sum +@accounts.pluck(:payment_creditor_cash_amount).compact.sum)
      @capital = @accounts.pluck(:opening_bank).compact.sum  + @accounts.pluck(:opening_cash).compact.sum 
    end

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
      params.require(:account).permit(:closing_inventory, :asset_purchase_bank_description, :asset_purchase_bank_amount, :asset_purchase_bank,:depreciation_bank,:asset_purchase_cash_description, :asset_purchase_cash_amount, :asset_purchase_cash,:depreciation_cash, :recurring_payment_bank_amount, :recurring_payment_bank_description, :recurring_payment_bank, :recurring_payment, :recurring_payment_description, :recurring_payment_amount, :open_cash_description, :opening_cash, :opening_bank, :user_id, :bank, :image, :cash_collection_amount, :cash_collection_description, :cash_purchase_amount, :cash_purchase_description, :credit_purchase_amount, :credit_purchase_description, :creditor_name, :payment_creditor_cash_amount, :payment_creditor_cash_description, :payment_creditor_bank_amount, :payment_creditor_bank_description, :card_collection_amount, :card_collection_description, :card_charges, :bank_transfer_amount, :bank_transfer_description, :fpx_collection_amount, :fpx_collection_description, :fpx_charges)
    end
end
