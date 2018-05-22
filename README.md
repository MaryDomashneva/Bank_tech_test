[![Build Status](https://travis-ci.org/MaryDomashneva/Bank_tech_test.svg?branch=master)](https://travis-ci.org/MaryDomashneva/Bank_tech_test)

Bank tech test
=================

## Specification

### Requirements

* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Result

#### Technology used

* Ruby 2.5.0
* Rspec
* Rubocop
* Simplecov

#### Run project

* In order to run tests, clone project, install ruby 2.5.0, install Rspec ```gem 'rspec'``` and ```rspec``` command in terminal.
* The easiest way to try project is in IRB: ```inside terminal irb -r./lib/bank.rb```

### Project description

The project has two classes: ```Bank``` and ```Printer```
Bank initialized with ```account```, if not specified equal 0 and empty ```transactions``` hash.

Bank has following methods:
* ```deposit``` allows user to add an amount to the bank account.
* ```withdrawal``` allows a user to take money from bank account.
* ```print_account_transactions``` responsible for printing all available bank transactions in a table format. class ```Printer``` called inside.

Printer has one method:
* ```print_statement```. Print header and transaction string.

### IRB example

```
Marias-MacBook-Pro:Bank_tech_test mariagetmanova$ irb -r./lib/bank.rb
2.5.0 :001 > bank = Bank.new
 => #<Bank:0x00007fbe7b958760 @account=0, @transactions={}>
2.5.0 :002 > bank.deposit(1000)
 => [1000, "debit", 1000]
2.5.0 :003 > exit
Marias-MacBook-Pro:Bank_tech_test mariagetmanova$ irb -r./lib/bank.rb
2.5.0 :001 > bank = Bank.new
 => #<Bank:0x00007fcb3d89c8c0 @account=0, @transactions={}>
2.5.0 :002 > bank.deposit(1000, '10/01/2012')
 => [1000, "debit", 1000]
2.5.0 :003 > bank.deposit(2000, '13/01/2012')
 => [2000, "debit", 3000]
2.5.0 :004 > bank.withdrawal(500, '14/01/2012')
 => [500, "credit", 2500]
2.5.0 :005 > bank.transactions
 => {"10/01/2012"=>[1000, "debit", 1000], "13/01/2012"=>[2000, "debit", 3000], "14/01/2012"=>[500, "credit", 2500]}
2.5.0 :006 > all_transactions = bank.transactions
 => {"10/01/2012"=>[1000, "debit", 1000], "13/01/2012"=>[2000, "debit", 3000], "14/01/2012"=>[500, "credit", 2500]}
2.5.0 :007 > bank.print_account_transactions(all_transactions)
"date || credit || debit || balance
14/01/2012 || 500.00 || || 2500.00
13/01/2012 || || 2000.00 || 3000.00
10/01/2012 || || 1000.00 || 1000.00"
 => "date || credit || debit || balance\n14/01/2012 || 500.00 || || 2500.00\n13/01/2012 || || 2000.00 || 3000.00\n10/01/2012 || || 1000.00 || 1000.00\n"
2.5.0 :008 > bank.withdrawal(3000)
Traceback (most recent call last):
        3: from /Users/mariagetmanova/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/mariagetmanova/Desktop/Makers_Projects/Bank_tech_test/lib/bank.rb:27:in `withdrawal'
RuntimeError (The amount you are trying withdraw is greater
    than the available balance!)
2.5.0 :009 > exit
```
