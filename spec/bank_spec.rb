require './lib/bank.rb'

describe Bank do
  it 'responds to deposit' do
    expect(subject).to respond_to(:deposit).with(1).argument
  end

  context 'when make a deposit' do
  end
end
