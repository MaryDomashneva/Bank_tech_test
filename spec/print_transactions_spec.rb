require './lib/bank.rb'
require './lib/print_transactions.rb'

describe Printer do
  it 'responds to print_header' do
    expect(subject).to respond_to :print_header
  end

  context 'when printing string header' do
    it 'prints header' do
      header = 'date || credit || debit || balance'
      expect(subject.print_header(header)).to equal(header)
    end
  end
end
