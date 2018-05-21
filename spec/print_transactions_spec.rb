require './lib/bank.rb'
require './lib/print_transactions.rb'

describe Printer do
  it 'responds to methods' do
    expect(subject).to respond_to(:print_statement).with(1).argument
  end

  context 'print_statement' do
    it 'returns correct string that is printed' do
      header = 'date || credit || debit || balance'
      transactions = {
        '10/01/2012' => [1000, 'debit', 1000],
        '13/01/2012' => [2000, 'debit', 3000],
        '14/01/2012' => [500, 'credit', 2500]
      }
      expect(subject.print_statement(transactions, header)).to eq(
        "date || credit || debit || balance\n14/01/2012 || 500.00 || || 2500.00\n13/01/2012 || || 2000.00 || 3000.00\n10/01/2012 || || 1000.00 || 1000.00\n"
      )
    end
  end
end
