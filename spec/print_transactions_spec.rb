require './lib/bank.rb'
require './lib/print_transactions.rb'

describe Printer do
  it 'responds to print_header' do
    expect(subject).to respond_to :return_string_header
    expect(subject).to respond_to(:return_string_transactions).with(1).argument
  end

  context 'when printing string header' do
    it 'prints header' do
      header = 'date || credit || debit || balance'
      expect(subject.return_string_header(header)).to equal(header)
    end
  end

  context 'when printing transactions' do
    it 'prints existing transactions' do
      transactions = {
        '10/01/2012' => [1000, 'debit', 1000],
        '13/01/2012' => [2000, 'debit', 3000],
        '14/01/2012' => [500, 'credit', 2500]
      }
      expect(subject.return_string_transactions(transactions)).to eq(
        '10/01/2012 || || 1000.00 || 1000.00 13/01/2012 || || 2000.00 || 3000.00 14/01/2012 || 500.00 || || 2500.00'
      )
    end
  end
end
