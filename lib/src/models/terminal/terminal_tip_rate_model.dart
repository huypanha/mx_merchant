class MxTerminalTipRateModel {
  /// Value of the rate
  final int value;

  /// Enable percentage
  final bool isPercentage;

  final int? decimalPlaces;
  final bool? isCurrency;

  MxTerminalTipRateModel({this.value = 0, this.isPercentage = true, this.decimalPlaces, this.isCurrency});

  Map<String, dynamic> toJson() {
    return {'value': value, 'isPercentage': isPercentage, 'decimalPlaces': decimalPlaces, 'isCurrency': isCurrency};
  }

  factory MxTerminalTipRateModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTipRateModel(
      value: json['value'] ?? 0,
      isPercentage: json['isPercentage'] ?? true,
      decimalPlaces: int.tryParse(json['decimalPlaces'].toString()),
      isCurrency: bool.tryParse(json['isCurrency'].toString()),
    );
  }
}
