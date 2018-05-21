class Bank

  attr_reader :account

  def initialize(account = 0)
    @account = account
  end

  def deposit(amount)
    @account += amount
  end
end
