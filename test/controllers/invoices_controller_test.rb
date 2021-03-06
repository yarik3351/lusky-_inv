require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get login" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { amount: @invoice.amount, currency: @invoice.currency, customer_id: @invoice.customer_id, date: @invoice.date, items: @invoice.items, number: @invoice.number, saved_bank_credentials: @invoice.saved_bank_credentials, saved_customer: @invoice.saved_customer, saved_user: @invoice.saved_user, status: @invoice.status, user_id: @invoice.user_id } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { amount: @invoice.amount, currency: @invoice.currency, customer_id: @invoice.customer_id, date: @invoice.date, items: @invoice.items, number: @invoice.number, saved_bank_credentials: @invoice.saved_bank_credentials, saved_customer: @invoice.saved_customer, saved_user: @invoice.saved_user, status: @invoice.status, user_id: @invoice.user_id } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
