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
    accessory = 'debit'
    current_balance = @account
    write_transaction(time, amount, accessory, current_balance)
  end

  def withdrawal(amount, time = Time.now)
    raise ERROR_MESSAGES[:exceeded_available_balance] if exceed_balance?(amount)
    @account -= amount
    accessory = 'credit'
    current_balance = @account
    write_transaction(time, amount, accessory, current_balance)
  end

  private

  def write_transaction(time, amount, accessory, current_balance)
    @transactions[time] = []
    @transactions[time].push(amount)
    @transactions[time].push(accessory)
    @transactions[time].push(current_balance)
  end

  def exceed_balance?(amount)
    @account < amount
  end
end
