import 'dart:io';

void main() {
  createSavingsAccount();
}


//Inheritance Parent class
//Encapsulation* private value
class BankAccount {
  String _accountHolderName;
  int _accountNumber;
  double _accountBalance;

  BankAccount(
      this._accountHolderName, this._accountNumber, this._accountBalance);

  //Getter for public access
  String get accountHolderName => _accountHolderName;
  int get accountNumber => _accountNumber;
  double get accountBalance => _accountBalance;

  //Add or Deposit
  void deposit(double amount) {
    if (amount > 0) {
      _accountBalance += amount;
      print('$amount is Successfully Deposited.');
      print('Current Balance: $_accountBalance');
    } else {
      print('$amount is Not Deposited. Try again Later');
      print('Current Balance: $_accountBalance');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _accountBalance) {
      _accountBalance -= amount;
      print('$amount is Successfully Withdrawn.');
      print('Current Balance: $_accountBalance');
    } else {
      print('$amount is Not Withdrawn. Try again Later');
      print('Current Balance: $_accountBalance');
    }
  }

  void displayAccountInfo() {
    print('-----Account Information-----');
    print('Account Holder Name: $accountHolderName');
    print('Account Number: $accountNumber');
    print('Current Balance: \$$accountBalance');
    print('----------------------');
  }

  void myMenu(BankAccount account) {
    while (true) {
      print('----------My MENU----------');
      print('1. Account Balance');
      print('2. Deposit Money');
      print('3. Withdraw Money');
      print('4. Exit');
      stdout.write('Please Select An Option: ');
      int option = int.parse(stdin.readLineSync()!);

      if (option == 1) {
        account.displayAccountInfo();
      } else if (option == 2) {
        stdout.write('Deposit Amount (\$): ');
        double amount = double.parse(stdin.readLineSync()!);
        account.deposit(amount);
      } else if (option == 3) {
        stdout.write('Withdraw Amount (\$): ');
        double amount = double.parse(stdin.readLineSync()!);
        account.withdraw(amount);
      } else if (option == 4) {
        print('Safe Exit Successfully');
        break;
      } else {
        print('Wrong input. Try Again Later');
      }
    }
  }
}


//Inheritance
//subClass or Child

class SavingsAccount extends BankAccount {
  final double _interestRate;
  SavingsAccount(String accountHolderName, int accountNumber,
      double accountBalance, this._interestRate)
      : super(accountHolderName, accountNumber, accountBalance);

  double get interestRate => _interestRate;

  void addInterest() {
    double interest = accountBalance * _interestRate / 100;
    deposit(interest);
    print('$interest is Added successfully');
  }
}



//Input information & Menu
void createSavingsAccount() {
  print('-----------Welcome To Dutch Bangla Bank PLC.-----------');
  stdout.write('Enter Account Holder Name (String) : ');
  String accountHolderName = stdin.readLineSync()!;
  stdout.write('Enter Account Number (Int): ');
  int accountNumber = int.parse(stdin.readLineSync()!);
  stdout.write('Enter Account Balance (Double) : ');
  double accountBalance = double.parse(stdin.readLineSync()!);
  stdout.write('Enter Interest Rate: ');
  double interestRate = double.parse(stdin.readLineSync()!);

  SavingsAccount savingsAccount = SavingsAccount(
      accountHolderName, accountNumber, accountBalance, interestRate);
  BankAccount bankAccount =
  BankAccount(accountHolderName, accountNumber, accountBalance);
  bankAccount.myMenu(savingsAccount);
}
