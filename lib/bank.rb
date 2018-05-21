require_relative './print_transactions'

class Bank
  attr_reader :account
  attr_reader :transactions

  ERROR_MESSAGES = {
    exceeded_available_balance: 'The amount you are trying withdraw is greater
    than the available balance!'
  }.freeze

  CREDIT_ACCESSORY = 'credit'
  DEBIT_ACCESSORY = 'debit'

  def initialize(account = 0)
    @account = account
    @transactions = {}
  end

  # strftime("%m/%d/%Y")

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
