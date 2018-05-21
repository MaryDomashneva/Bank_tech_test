require './lib/bank.rb'

describe Bank do
  it 'responds to deposit' do
    expect(subject).to respond_to(:deposit).with(1).argument
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
        expect(bank.account).to be_nil
      end
    end
  end

  context 'when make a deposit' do
  end
end
