class MxTerminalPaymentMethodModel {
  /// Credit
  final bool credit;

  /// debit
  final bool debit;

  MxTerminalPaymentMethodModel({this.credit = true, this.debit = true});

  Map<String, dynamic> toJson() {
    return {'credit': credit, 'debit': debit};
  }
}
