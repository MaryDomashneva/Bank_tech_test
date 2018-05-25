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
      string += "#{format_date(transaction.date)}" \
                      "|| #{credit?(transaction)} || #{debit?(transaction)} || " \
                      "#{format_float(transaction.current_balance)}\n"
    end
    string.chomp(' ')
  end

  def debit?(transaction)
    transaction.accessory == 'debit' ? format_float(transaction.amount) : ''
  end

  def credit?(transaction)
    transaction.accessory == 'credit' ? format_float(transaction.amount) : ''
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
