require 'date'

class Printer
  def return_string_header(header = 'date || credit || debit || balance')
    header
  end

  def return_string_transactions(transactions)
    string = ''
    all_transactions = hash_reverse(transactions)
    all_transactions.each do |date, statement|
      if statement[1] == 'debit'
        then string += "#{date_modif(date)} || || #{to_float(statement[0])} || #{to_float(statement[2])} \n"
      else string += "#{date_modif(date)} || #{to_float(statement[0])} || || #{to_float(statement[2])} \n"
      end
    end
    string.chomp(' ')
  end

  def print_statement(header = 'date || credit || debit || balance', transactions)
    p return_string_header(header)
    p return_string_transactions(transactions)
  end

  private

  def to_float(number)
    format('%.2f', number)
  end

  def date_modif(date_string)
    Date.parse(date_string).strftime('%d/%m/%Y')
  end

  def hash_reverse(hash)
    hash.sort.reverse.to_h
  end
end
