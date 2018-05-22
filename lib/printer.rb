require 'date'

# Helper class to print formatted string
class Printer
  HEADER = 'date || credit || debit || balance'.freeze

  def print_statement(transactions, header = HEADER)
    result_string = header + "\n" + convert_transactions_to_string(transactions)
    puts result_string
  end

  private

  def convert_transactions_to_string(transactions)
    string = ''
    all_transactions = sort_transactions_by_date(transactions)
    all_transactions.each do |transaction|
      accessory = transaction.accessory.downcase
      formatter_method = "format_#{accessory}_transaction".to_sym
      string += send(formatter_method, transaction)
    end
    string.chomp(' ')
  end

  def format_debit_transaction(transaction)
    "#{format_date(transaction.date)} || || \
#{format_float(transaction.amount)} \
|| #{format_float(transaction.current_balance)}\n"
  end

  def format_credit_transaction(transaction)
    "#{format_date(transaction.date)} || \
#{format_float(transaction.amount)} || \
|| #{format_float(transaction.current_balance)}\n"
  end

  def format_float(number)
    format('%.2f', number)
  end

  def format_date(date_string)
    Date.parse(date_string).strftime('%d/%m/%Y')
  end

  def sort_transactions_by_date(transactions)
    transactions.sort { |x, y| y.date <=> x.date }
  end
end
