abstract class MerchantTransactionSecureType {
  static const String auto = 'AUTO';
  static const String e3DS = '3DS';
  static const String non3DS = 'NON3DS';
}

abstract class CurrencyType {
  static const String uah = 'UAH';
  static const String usd = 'USD';
  static const String eur = 'EUR';
}

abstract class TransactionType {
  static const String charge = 'CHARGE';
  static const String complete3DS = 'COMPLETE_3DS';
}

class TransactionStatus {
  static const String inProcessing = 'InProcessing';
  static const String approved = 'Approved';
  static const String declined = 'Declined';
}
