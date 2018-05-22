require_relative './printer'
require_relative './transaction'
require 'yaml'

# Bank holds information about user's account and trasactions
class Bank
  attr_reader :account
  attr_reader :transactions

  APP_CONFIG = YAML.load_file(File.join(__dir__, '../config/constants.yml'))

  def initialize(account = 0)
    @account = account
    @transactions = []
  end

  def deposit(amount, date = Time.now)
    @account += amount
    accessory = APP_CONFIG['accessories']['debit']
    current_balance = @account
    @transactions << Transaction.new(date, amount, accessory, current_balance)
  end

  def withdrawal(amount, date = Time.now)
    error = APP_CONFIG['error_messages']['exceeded_available_balance']
    raise error if exceed_balance?(amount)
    @account -= amount
    accessory = APP_CONFIG['accessories']['credit']
    current_balance = @account
    @transactions << Transaction.new(date, amount, accessory, current_balance)
  end

  def print_account_transactions(transactions, printer = Printer.new)
    printer.print_statement(transactions)
  end

  private

  def exceed_balance?(amount)
    @account < amount
  end
end
