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

Printer has two classes:
* ```print_statement```. Print header and transaction string.

### IRB example

```
Marias-MacBook-Pro:Bank_tech_test mariagetmanova$ irb -r./lib/bank.rb
2.5.0 :001 > bank = Bank.new(10000)
 => #<Bank:0x00007fc46a8dc6c0 @account=10000, @transactions={}>
2.5.0 :002 > bank.deposit(675)
 => [675, "debit", 10675]
2.5.0 :003 > bank.deposit(25)
 => [25, "debit", 10700]
2.5.0 :004 > bank.withdrawal(700)
 => [700, "credit", 10000]
2.5.0 :005 > bank.withdrawal(20000)
Traceback (most recent call last):
        3: from /Users/mariagetmanova/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/mariagetmanova/Desktop/Makers_Projects/Bank_tech_test/lib/bank.rb:27:in `withdrawal'
RuntimeError (The amount you are trying withdraw is greater
    than the available balance!)
2.5.0 :006 > bank.transactions
 => {2018-05-21 17:04:29 +0100=>[675, "debit", 10675], 2018-05-21 17:04:40 +0100=>[25, "debit", 10700], 2018-05-21 17:04:56 +0100=>[700, "credit", 10000]}
2.5.0 :007 > all_transactions = bank.transactions
 => {2018-05-21 17:04:29 +0100=>[675, "debit", 10675], 2018-05-21 17:04:40 +0100=>[25, "debit", 10700], 2018-05-21 17:04:56 +0100=>[700, "credit", 10000]}
2.5.0 :008 > bank.print_account_transactions(all_transactions)
"date || credit || debit || balance"
"05/21/2018 || 700.00 || || 10000.00 \n05/21/2018 || || 25.00 || 10700.00 \n05/21/2018 || || 675.00 || 10675.00 \n"
"05/21/2018 || 700.00 || || 10000.00 \n05/21/2018 || || 25.00 || 10700.00 \n05/21/2018 || || 675.00 || 10675.00 \n"
 => "05/21/2018 || 700.00 || || 10000.00 \n05/21/2018 || || 25.00 || 10700.00 \n05/21/2018 || || 675.00 || 10675.00 \n"
2.5.0 :009 > exit
```
