require './lib/bank.rb'
require './lib/print_transactions.rb'
require './lib/accessories.rb'



describe Printer do
  it 'responds to methods' do
    expect(subject).to respond_to(:print_statement).with(1).argument
  end


  describe '#print_statement' do

    it 'prints statement' do

      header = 'date || credit || debit || balance'
      transactions = {
        '10/01/2012' => [1000, 'debit', 1000],
        '13/01/2012' => [2000, 'debit', 3000],
        '14/01/2012' => [500, 'credit', 2500]
      }

      expect {subject.print_statement(transactions, header)}.to output(MESSAGE).to_stdout
    end
  end
end
