class BankAccount {
    final int accountId;
    final String ownerName;
    double _balance;

    BankAccount(this.accountId, this.ownerName, [this._balance =0]);

    // Return balance
    double balance () => _balance;

    // Deposit method
    void credit(double amount) {
      if (amount <= 0){
        throw Exception('Credit amount must be greater than zero.');
      }
      _balance += amount;
    }

    // Withdraw method 
    void withdraw(double amount) {
      if (amount <= 0){
        throw Exception('Withdrawal amount must be greater than zero.');
      }
      if (_balance - amount  < 0){
        throw Exception('Insufficient balance for withdrawal.');
      }
      _balance -= amount;
    }

    @override
    String toString() {
      return 'Account ID: $accountId, Owner: $ownerName, Balance: \$${_balance.toStringAsFixed(2)}';
    } 
}

class Bank {
    final String Name;
    final List<BankAccount> _accounts = [];

    Bank(this.Name);

    //Create new account
    BankAccount createAccount(int accountId, String accountOwner) {
      for (var acc in _accounts){
      if(acc.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists');
      }
    }
    var newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
    }

    // Display accounts
    void showAllAccounts() {
      print('--- Account List ---');
      for (var acc in _accounts) {
        print(acc);
      }
    }
}
 
void main() {

  Bank myBank = Bank('CADT Bank');
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

  try {
     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
   } catch (e) {
     print(e); // Output: Account with ID 100 already exists!
   }
}
