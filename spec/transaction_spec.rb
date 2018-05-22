require './lib/transaction.rb'

describe Transaction do

  describe '#initialize' do
    it 'creates correct transaction' do
      transaction = Transaction.new('10/01/2012', 1000, 'debit', 1000)
      expect(transaction.date).to eq('10/01/2012')
      expect(transaction.amount).to eq(1000)
      expect(transaction.accessory).to eq('debit')
      expect(transaction.current_balance).to eq(1000)
    end
  end
end
