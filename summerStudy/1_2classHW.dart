class Account {
  int AccountNum;
  String name;
  double _balance;

  Account(this.AccountNum, this.name, this._balance);

  void deposit(double amount) {
    print("$amount원을 입금합니다.");
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance < amount)
      print('$amount원 인출을 시도하였으나 잔액이 부족해 출금할 수 없습니다.');
    else {
      print("$amount원을 인출합니다.");
      _balance -= amount;
    }
  }

  double getBalance() {
    return _balance;
  }
}

class MaxLimitAccount extends Account {
  double maxLimit;

  MaxLimitAccount(int AccountNum, String name, double balance, this.maxLimit)
      : super(AccountNum, name, balance);

  @override
  void deposit(double amount) {
    var totalBalance = _balance + amount;
    if (totalBalance > maxLimit)
      print('$amount원 입금을 시도하였으나 저축 가능한 최대 한도 $maxLimit을 초과하였습니다.');
    else
      super.deposit(amount);
  }
}

void main() {
  print('Account 클래스 테스트');
  Account account1 = Account(123456789, '홍길동', 500);
  print('잔액: ${account1.getBalance()}');
  account1.deposit(1000);
  print('잔액: ${account1.getBalance()}'); //1500
  account1.withdraw(700);
  print('잔액: ${account1.getBalance()}'); //800
  account1.withdraw(3000);
  print('잔액: ${account1.getBalance()}'); //800

  print('\nMaxLimitAccount 클래스 테스트');
  MaxLimitAccount account2 = MaxLimitAccount(11111111, '홍길동', 500, 2000);
  print('잔액: ${account2.getBalance()}'); //500
  account2.deposit(500);
  print('잔액: ${account2.getBalance()}'); //1000
  account2.deposit(2000);
  print('잔액: ${account2.getBalance()}'); //1000
}
