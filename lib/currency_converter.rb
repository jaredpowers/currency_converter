require_relative '../bin/currency.rb'

class CurrencyConverter
  attr_reader :rate_library
  def initialize (rate_library)
    @rate_library = rate_library
  end

  def converter(currency, code)
    currency_amount = currency.amount
    
  end
end
