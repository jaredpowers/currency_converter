require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency.rb'

class CurrencyTest < MiniTest::Test

  def test_currency_class_exist
  assert Currency.new(20, "USD")
  end

  def test_amount
    # amount = 20
    currency = Currency.new(20, "USD")
    assert_equal(20, currency.amount)
  end

  def test_code
    # code = "USD"
    currency = Currency.new(20, "USD")
    assert_equal("USD",currency.code)
  end

  def test_two_currency
    currency1 = Currency.new(20, "USD")

    currency2 = Currency.new(20, "USD")
    assert_equal(currency1, currency2) ##match

    currency3 = Currency.new(20, "JPY")
    refute_equal(currency1, currency3) ##doesn't match

    currency4 = Currency.new(10, "JPY")
    refute_equal(currency3, currency4)

    currency5 = Currency.new(50, "GBP")
    refute_equal(currency1, currency5)
  end

  def test_add_two_same_code_currencies
    currency3 = Currency.new(20, "JPY")
    currency4 = Currency.new(10, "JPY")
    currency5 = Currency.new(30, "JPY")
    assert_equal(currency5, currency3 + currency4)

    currency1 = Currency.new(20, "USD")
    currency3 = Currency.new(20, "JPY")
    assert_raises DifferenceCurrencyCode do
      currency1 + currency3
    end
  end
end
