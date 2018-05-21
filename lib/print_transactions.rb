class Printer

  def return_string_header(header = 'date || credit || debit || balance')
    @header = header
  end

  def return_string_transactions(transactions)
    @string = ''
    @transactions = transactions.sort.reverse.to_h
    @transactions.each do |date, statement|
      if statement[1] == 'debit'
        then @string += "#{date.strftime("%m/%d/%Y")} || || #{to_float(statement[0])} || #{to_float(statement[2])} \n"
      else @string += "#{date.strftime("%m/%d/%Y")} || #{to_float(statement[0])} || || #{to_float(statement[2])} \n"
      end
    end
    p @string.chomp(' ')
    @string.chomp(' ')
  end

  def print_statement(header = 'date || credit || debit || balance', transactions)
    p return_string_header(header)
    p return_string_transactions(transactions)
  end

  private

  def to_float(number)
    "%.2f" % number
  end
end
