enum TransactionStatusEnum {
  newState,
  reviewed,
  approved,
  rejected,
  postponed,
  canceled,
  toBeModified,
}

extension TransactionStatusEnumExtension on TransactionStatusEnum {
  static TransactionStatusEnum get(String name) {
    if (name.toLowerCase() == "new") {
      return TransactionStatusEnum.newState;
    } else {
      return TransactionStatusEnum.values
          .firstWhere((e) => e.name == name.toLowerCase());
    }
  }
}
