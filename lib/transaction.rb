# Transaction describes the bank transaction
class Transaction
  attr_reader :date, :amount, :accessory, :current_balance

  def initialize(date, amount, accessory, current_balance)
    @date = date
    @amount = amount
    @accessory = accessory
    @current_balance = current_balance
  end
end
