require_relative './accessories'
require_relative './print_transactions'

# Bank holds information about user's account and trasactions
class Bank
  attr_reader :account
  attr_reader :transactions

  def initialize(account = 0)
    @account = account
    @transactions = {}
  end

  def deposit(amount, date = Time.now)
    @account += amount
    accessory = DEBIT_ACCESSORY
    current_balance = @account
    write_transaction(date, amount, accessory, current_balance)
  end

  def withdrawal(amount, date = Time.now)
    raise ERROR_MESSAGES[:exceeded_available_balance] if exceed_balance?(amount)
    @account -= amount
    accessory = CREDIT_ACCESSORY
    current_balance = @account
    write_transaction(date, amount, accessory, current_balance)
  end

  def print_account_transactions(transactions)
    printer = Printer.new
    printer.print_statement(transactions)
  end

  private

  def write_transaction(date, amount, accessory, current_balance)
    transaction = [amount, accessory, current_balance]
    @transactions[date] = transaction
  end

  def exceed_balance?(amount)
    @account < amount
  end
end
