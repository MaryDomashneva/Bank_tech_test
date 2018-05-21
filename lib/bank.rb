class Bank
  attr_reader :account
  attr_reader :transactions

  ERROR_MESSAGES = {
    exceeded_available_balance: 'The amount you are trying withdraw is greater than the
     available balance!',
  }.freeze

  def initialize(account = 0)
    @account = account
    @transactions = {}
  end

  def deposit(amount, time = Time.now)
    @account += amount
    write_transaction(amount, time)
  end

  def withdrawal(amount, time = Time.now)
    raise ERROR_MESSAGES[:exceeded_available_balance] if exceed_balance?(amount)
    @account -= amount
    write_transaction(amount, time)
  end

  private

  def write_transaction(amount, time)
    @transactions[time] = amount
  end

  def exceed_balance?(amount)
    @account < amount
  end
end
