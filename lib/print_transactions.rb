class Printer
  def return_string_header(header = 'date || credit || debit || balance')
    @header = header
  end

  def return_string_transactions(transactions)
    @string = ''
    transactions.each do |date, transaction|
      if transaction[1] == 'debit'
        then @string += "#{date} || || #{to_float(transaction[0])} || #{to_float(transaction[2])} "
      else @string += "#{date} || #{to_float(transaction[0])} || || #{to_float(transaction[2])} "
      end
    end
    @string.chomp(' ')
  end

  private

  def to_float(number)
    "%.2f" % number
  end
end
