require 'date'
require_relative './accessories'

# Helper class to print formatted string
class Printer
  def print_statement(transactions, header = default_header)
    result_string = header + "\n" + convert_transactions_to_string(transactions)
    p result_string
    result_string
  end

  private

  def default_header
    'date || credit || debit || balance'
  end

  def convert_transactions_to_string(transactions)
    string = ''
    all_transactions = reverse_hash(transactions)
    all_transactions.each do |date, statement|
      string += if statement[1] == DEBIT_ACCESSORY
                  format_debit_transaction(date, statement)
                else
                  format_credit_transaction(date, statement)
                end
    end
    string.chomp(' ')
  end

  def format_debit_transaction(date, statement)
    "#{format_date(date)} || || #{format_float(statement[0])} \
|| #{format_float(statement[2])}\n"
  end

  def format_credit_transaction(date, statement)
    "#{format_date(date)} || #{format_float(statement[0])} || \
|| #{format_float(statement[2])}\n"
  end

  def format_float(number)
    format('%.2f', number)
  end

  def format_date(date_string)
    Date.parse(date_string).strftime('%d/%m/%Y')
  end

  def reverse_hash(hash)
    hash.sort.reverse.to_h
  end
end
