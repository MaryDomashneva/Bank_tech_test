require './lib/bank.rb'
require './lib/printer.rb'

describe Printer do
  APP_CONFIG = YAML.load_file(File.join(__dir__, '../config/constants.yml'))

  it 'responds to methods' do
    expect(subject).to respond_to(:print_statement).with(1).argument
  end

  describe '#print_statement' do

    it 'prints statement' do

      header = 'date || credit || debit || balance'
      transactions = [
        Transaction.new('10/01/2012', 1000, 'debit', 1000),
        Transaction.new('13/01/2012', 2000, 'debit', 3000),
        Transaction.new('14/01/2012', 500, 'credit', 2500)
      ]

      expect {subject.print_statement(transactions, header)}.to output(  APP_CONFIG['header']).to_stdout
    end
  end
end
