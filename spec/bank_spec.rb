require './lib/bank.rb'

describe Bank do

  APP_CONFIG = YAML.load_file(File.join(__dir__, '../config/constants.yml'))

  it 'responds to deposit' do
    expect(subject).to respond_to(:deposit).with(2).argument
  end

  it 'responds to withdrawal' do
    expect(subject).to respond_to(:withdrawal).with(2).argument
  end

  describe '#initialize' do
    context 'when a account is specified' do
      it 'uses that account' do
        account = 1000
        bank = Bank.new(account)
        expect(bank.account).to equal(account)
      end
    end
    context 'when a account is not specified' do
      it 'create a zero account' do
        bank = Bank.new
        expect(bank.account).to equal(0)
      end
    end
  end

  describe '#deposit' do
    before(:each) do
      @bank = Bank.new
      @bank.deposit(1000, '10/01/2012')
    end

    it 'adds amount to bank account' do
      expect(@bank.account).to equal(1000)
    end

    it 'writes amount to debit transaction' do
      expect(@bank.transactions[0].amount).to equal(1000)
    end

    it 'writes current balance to debit transaction' do
      expect(@bank.transactions[0].current_balance).to equal(1000)
    end
  end

  describe '#withdrawal' do
    before(:each) do
      @bank = Bank.new(1000)
    end

    context 'when withdraw amount more than available balance' do
      it 'raises an error' do
        expect { @bank.withdrawal(1500) }.to raise_error(
          APP_CONFIG['error_messages']['exceeded_available_balance']
        )
      end
    end

    context 'when withdraw correct amount' do
      it 'deducted from bank account' do
        @bank.withdrawal(500, '14/01/2012')
        expect(@bank.account).to equal(500)
      end

      it 'writes amount to credit transaction' do
        @bank.withdrawal(500, '14/01/2012')
        expect(@bank.transactions[0].amount).to equal(500)
      end

      it 'writes current balance to debit transaction' do
        @bank.withdrawal(500, '14/01/2012')
        expect(@bank.transactions[0].current_balance).to equal(500)
      end
    end
  end

  describe '#print_account_transactions' do
    before(:each) do
      @bank = Bank.new(1000)
      @transactions = [
        Transaction.new('10/01/2012', 1000, 'debit', 1000),
        Transaction.new('13/01/2012', 2000, 'debit', 3000),
        Transaction.new('14/01/2012', 500, 'credit', 2500)
      ]
      @printer = double(:print)
      allow(@printer).to receive(:print_statement)
    end

    it 'tells printer to print transactions' do
      expect(@printer).to receive(:print_statement).with(@transactions)
      @bank.print_account_transactions(@transactions, @printer)
    end
  end
end
