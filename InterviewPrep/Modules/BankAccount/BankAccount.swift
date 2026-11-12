//
//  BankAccount.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

/*
 Solution Steps:
 
 1. Talk throuogh prompt and give ierview of how you would solve
  - create class for bankAccount
  - create error enumeration for error cases
 2. Ask clarify questions
  - Account name is okay String?
  - Account number is also okay as String?
  - Initial balance as Double
 3. Start coding!
 */

enum BankAccountError: Error {
    case insufficientFunds
    case invalidAmount
    case sameAccountTransfer
    case fraudAlert
}

class BankAccount {
    let owner: String
    let accountNumber: String
    var balance: Double
    
    private let fraudThreshold: Double = 5000
    
    init(owner: String, accountNumber: String, balance: Double) {
        self.owner = owner
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        balance += amount
    }
    
    func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        guard balance >= amount else { throw BankAccountError.insufficientFunds }
        guard amount < fraudThreshold else { throw BankAccountError.fraudAlert }
        
        balance -= amount
    }
    
    func transfer(to receiver: BankAccount, amount: Double) throws {
        guard accountNumber != receiver.accountNumber else { throw BankAccountError.sameAccountTransfer }
        
        try self.withdraw(amount)
        try receiver.deposit(amount)
    }
}
