require 'date'

class Printer

  def print_statement(header = default_header, transactions)
    p header
    p convert_transactions_to_string(transactions)
  end

  private

  def default_header
    'date || credit || debit || balance'
  end

  def convert_transactions_to_string(transactions)
    string = ''
    all_transactions = reverse_hash(transactions)
    all_transactions.each do |date, statement|
      if statement[1] == 'debit' then
        string += "#{format_date(date)} || || #{format_float(statement[0])} || #{format_float(statement[2])}\n"
      else
        string += "#{format_date(date)} || #{format_float(statement[0])} || || #{format_float(statement[2])}\n"
      end
    end
    string.chomp(' ')
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
