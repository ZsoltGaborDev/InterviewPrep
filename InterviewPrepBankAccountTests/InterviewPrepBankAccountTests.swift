//
//  InterviewPrepBankAccountTests.swift
//  InterviewPrepBankAccountTests
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Testing

@testable import InterviewPrep
struct InterviewPrepBankAccountTests {
    
    @Test func testBankAccountInit() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 1000)
        
        #expect(account.balance == 1000)
        #expect(account.accountNumber == "123456789")
        #expect(account.owner == "Peter Pan")
    }
    
    @Test func testDepositSuccess() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 1000)
        
        do { try account.deposit(300) }
        catch { print("DEBUG: Failed deposit bank account test with error: \(error)") }
        
        #expect(account.balance == 1300)
    }
    
    @Test func testInvalidAmount() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 1000)
        
        #expect(throws: BankAccountError.invalidAmount) {
            try account.deposit(-300)
        }
        #expect(account.balance == 1000)
    }
    
    @Test func testWithdrawSuccess() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 1000)
        
        do { try account.withdraw(300) }
        catch { print("DEBUG: Failed withdraw bank account test with error: \(error)") }
        
        #expect(account.balance == 700)
    }
    
    @Test func testWithdrawWithInsufitientFunds() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 1000)
        
        #expect(throws: BankAccountError.insufficientFunds) {
            try account.withdraw(1300)
        }
        #expect(account.balance == 1000)
    }
    
    @Test func testWithdrawWithFraud() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 8000)
        
        #expect(throws: BankAccountError.fraudAlert) {
            try account.withdraw(5100)
        }
        #expect(account.balance == 8000)
    }
    
    @Test func testTranserSuccess() {
        let account1 = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 8000)
        let account2 = BankAccount(owner: "Ralph Schumacher", accountNumber: "987654321", balance: 3000)
        
        do {
            try account1.transfer(to: account2, amount: 4000)
        } catch {
            print("DEBUG: Failed Transfer Success test with error: \(error)")
        }
        #expect(account1.balance == 4000)
        #expect(account2.balance == 7000)
    }
    
    @Test func testTranserInsufficientFund() {
        let account1 = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 8000)
        let account2 = BankAccount(owner: "Ralph Schumacher", accountNumber: "987654321", balance: 3000)
        
        #expect(throws: BankAccountError.insufficientFunds) {
            try account2.transfer(to: account1, amount: 4000)
        }
        #expect(account1.balance == 8000)
        #expect(account2.balance == 3000)
    }
    
    @Test func testTranserSameAccount() {
        let account = BankAccount(owner: "Peter Pan", accountNumber: "123456789", balance: 8000)
        
        #expect(throws: BankAccountError.sameAccountTransfer) {
            try account.transfer(to: account, amount: 4000)
        }
        #expect(account.balance == 8000)
    }
}
