require './lib/bank.rb'

describe Bank do

  ERROR_MESSAGES = {
    exceeded_available_balance: 'The amount you are trying withdraw is greater than the
     available balance!',
  }.freeze

  before(:all) do
    @bank = Bank.new
  end

  it 'responds to deposit' do
    expect(subject).to respond_to(:deposit).with(2).argument
  end

  it 'responds to withdrawal' do
    expect(subject).to respond_to(:withdrawal).with(2).argument
  end

  context 'Initialize' do
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

  context 'when make a deposit to a bank account' do
    it 'adds amount to bank account' do
      @bank.deposit(1000, '10/01/2012')
      expect(@bank.account).to equal(1000)
    end

    it 'writes to debit transaction' do
      expect(@bank.debit_transactions['10/01/2012']).to equal(1000)
    end
  end

  context 'when withdrawal from account' do
    it 'raises an error when withdraw amount more than available balance' do
      expect { @bank.withdrawal(1500) }.to raise_error(
        ERROR_MESSAGES[:exceeded_available_balance]
      )
    end

    it 'deducted from bank account when withdraw correct amount' do
      @bank.withdrawal(500, '14/01/2012')
      expect(@bank.account).to equal(500)
    end

    it 'writes to credit transaction' do
      expect(@bank.credit_transactions['14/01/2012']).to equal(500)
    end
  end
end
