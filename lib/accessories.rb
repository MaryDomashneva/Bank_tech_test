CREDIT_ACCESSORY = 'credit'.freeze
DEBIT_ACCESSORY = 'debit'.freeze
MESSAGE = "\"date || credit || debit || balance\\n14/01/2012 || 500.00 || || 2500.00\\n13/01/2012 || || 2000.00 || 3000.00\\n10/01/2012 || || 1000.00 || 1000.00\\n\"\n".freeze
ERROR_MESSAGES = {
  exceeded_available_balance: 'The amount you are trying withdraw is greater
  than the available balance!',
  err: 'Something went wrong:'
}.freeze
