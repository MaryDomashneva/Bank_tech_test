require_relative './print_transactions'

class Bank
  attr_reader :account
  attr_reader :transactions

  ERROR_MESSAGES = {
    exceeded_available_balance: 'The amount you are trying withdraw is greater
    than the available balance!'
  }.freeze

  def initialize(account = 0)
    @account = account
    @transactions = {}
  end

  # strftime("%m/%d/%Y")

  def deposit(amount, date = Time.now)
    @account += amount
    accessory = 'debit'
    current_balance = @account
    write_transaction(date, amount, accessory, current_balance)
  end

  def withdrawal(amount, date = Time.now)
    raise ERROR_MESSAGES[:exceeded_available_balance] if exceed_balance?(amount)
    @account -= amount
    accessory = 'credit'
    current_balance = @account
    write_transaction(date, amount, accessory, current_balance)
  end

  def print_account_transactions(transactions)
    transactions = @transactions
    printer = Printer.new
    printer.print_statement(header = 'date || credit || debit || balance', transactions)
  end

  private

  def write_transaction(date, amount, accessory, current_balance)
    @transactions[date] = []
    @transactions[date].push(amount)
    @transactions[date].push(accessory)
    @transactions[date].push(current_balance)
  end

  def exceed_balance?(amount)
    @account < amount
  end
end
