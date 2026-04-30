class MxTerminalTipRateModel {
  /// Value of the rate
  final int value;

  /// Enable percentage
  final bool isPercentage;

  MxTerminalTipRateModel({this.value = 0, this.isPercentage = true});

  Map<String, dynamic> toJson() {
    return {'value': value, 'isPercentage': isPercentage};
  }
}
