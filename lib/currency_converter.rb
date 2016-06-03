require_relative '../bin/currency.rb'

class UnknownCurrencyCodeError < StandardError
  def message
    "Unknown Currency code."
  end
end

class CurrencyConverter
  attr_reader :rate_library
  def initialize (rate_library)
    @rate_library = rate_library
  end

  def converter(currency, code)
    currency_amount = currency.amount
    currency_code = currency.code
    new_code = code
    currency_rate_1 = @rate_library.fetch(new_code)
    currency_rate_2 = @rate_library.fetch(currency_code)
    if @rate_library.key?(new_code)
      converted_amount = currency_amount * currency_rate_1
    else
      raise UnknownCurrencyCodeError
    end
  end
end
