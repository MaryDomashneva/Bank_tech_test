require './lib/bank.rb'
require './lib/print_transactions.rb'

describe Print do
  it 'responds to print_header' do
    expect(subject).to respond_to :print_header
  end
end
