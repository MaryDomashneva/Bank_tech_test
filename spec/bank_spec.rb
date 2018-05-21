require './lib/bank.rb'

describe Bank do

  before(:all) do
    @bank = Bank.new
  end

  it 'responds to deposit' do
    expect(subject).to respond_to(:deposit).with(1).argument
  end

  it 'responds to withdrawal' do
    expect(subject).to respond_to(:withdrawal).with(1).argument
  end

  context "Initialize" do
    context "when a account is specified" do
      it "uses that account" do
        account = 1000
        bank = Bank.new(account)
        expect(bank.account).to equal(account)
      end
    end
    context "when a account is not specified" do
      it "create a zero account" do
        bank = Bank.new
        expect(bank.account).to equal(0)
      end
    end
  end

  context 'when make a deposit to a bank account' do
    it 'adds to bank account' do
      @bank.deposit(1000)
      expect(@bank.account).to equal(1000)
    end
  end

  context 'when withdrawal from account' do
    it 'deducted from bank account' do
      @bank.withdrawal(500)
      expect(@bank.account).to equal(500)
    end
  end
end
