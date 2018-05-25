class TransactionList
  attr_reader :list
  def initialize(list = [])
    @list = list
  end

  def save(transaction)
    @list << transaction
  end
end
