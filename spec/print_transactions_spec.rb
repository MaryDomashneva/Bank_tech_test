require './lib/bank.rb'
require './lib/print_transactions.rb'

describe Printer do
  it 'responds to print_header' do
    expect(subject).to respond_to :print_header
    expect(subject).to respond_to(:print_transactions).with(1).argument
  end

  context 'when printing string header' do
    it 'prints header' do
      header = 'date || credit || debit || balance'
      expect(subject.print_header(header)).to equal(header)
    end
  end

  context 'when printing transactions' do
    it 'prints existing transactions' do
    end
  end
end
