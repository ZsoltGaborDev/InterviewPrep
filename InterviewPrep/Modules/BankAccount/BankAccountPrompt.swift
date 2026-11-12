//
//  BankAccountPrompt.swift
//  InterviewPrep
//
//  Created by Zsolt Gabor on 12/11/2026.
//

import Foundation

/*
 Prompt:
 
 You are building a Bank Account System that allows users to:
 
 Create a bank account with an initial deposit.
  - Deposit and withdraw money while handling invalid transactions.
  - Transfer money between accounts
  - Detect fraudulent transactions, specifically withdrawals over $5,000.
  
 Requirements:
 Implement BankAccount with:
  - Each account has an owner name, account number, and initial balance
  - deposit and withdraw methods
  - a tranfer method to send money between accounts
  - fraud detection for withdrawals exceeding $5,000
  - handle banking errors, including insufficient founds, invalid amounts, and same-account transfers and fraud alerts
 
 Follow-Up Questions:
  - How would you modify your implementation to ensure thread safety when multiple transactions occur simultaneously?
  - How would you extend this system to support transaction history and reporting?
  - What strategies would you use to prevent false fraud detections, sunch as legitimate large withdrawals?

 */

struct Transaction {
    let amount: Double
    let type: TransactionType
    let timestamp: Date
    let status: TransactionStatus
}

enum TransactionType {
    case deposit
    case withdraw
    //...
}

enum TransactionStatus {
    case completed
    case pending
    case failed
}
