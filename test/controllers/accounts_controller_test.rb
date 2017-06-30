require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { bank: @account.bank, bank_transfer_amount: @account.bank_transfer_amount, bank_transfer_description: @account.bank_transfer_description, card_charges: @account.card_charges, card_collection_amount: @account.card_collection_amount, card_collection_description: @account.card_collection_description, cash_collection_amount: @account.cash_collection_amount, cash_collection_description: @account.cash_collection_description, cash_purchase_amount: @account.cash_purchase_amount, cash_purchase_description: @account.cash_purchase_description, credit_purchase_amount: @account.credit_purchase_amount, credit_purchase_description: @account.credit_purchase_description, creditor_name: @account.creditor_name, fpx_charges: @account.fpx_charges, fpx_collection_amount: @account.fpx_collection_amount, fpx_collection_description: @account.fpx_collection_description, image: @account.image, opening_bank: @account.opening_bank, opening_cash: @account.opening_cash, payment_creditor_bank_amount: @account.payment_creditor_bank_amount, payment_creditor_bank_description: @account.payment_creditor_bank_description, payment_creditor_cash_amount: @account.payment_creditor_cash_amount, payment_creditor_cash_description: @account.payment_creditor_cash_description, user_id: @account.user_id } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { bank: @account.bank, bank_transfer_amount: @account.bank_transfer_amount, bank_transfer_description: @account.bank_transfer_description, card_charges: @account.card_charges, card_collection_amount: @account.card_collection_amount, card_collection_description: @account.card_collection_description, cash_collection_amount: @account.cash_collection_amount, cash_collection_description: @account.cash_collection_description, cash_purchase_amount: @account.cash_purchase_amount, cash_purchase_description: @account.cash_purchase_description, credit_purchase_amount: @account.credit_purchase_amount, credit_purchase_description: @account.credit_purchase_description, creditor_name: @account.creditor_name, fpx_charges: @account.fpx_charges, fpx_collection_amount: @account.fpx_collection_amount, fpx_collection_description: @account.fpx_collection_description, image: @account.image, opening_bank: @account.opening_bank, opening_cash: @account.opening_cash, payment_creditor_bank_amount: @account.payment_creditor_bank_amount, payment_creditor_bank_description: @account.payment_creditor_bank_description, payment_creditor_cash_amount: @account.payment_creditor_cash_amount, payment_creditor_cash_description: @account.payment_creditor_cash_description, user_id: @account.user_id } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
