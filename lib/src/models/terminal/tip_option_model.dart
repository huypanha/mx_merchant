import 'package:mx_merchant/src/models/terminal/terminal_tip_rate_model.dart';

class MxTerminalTipOptionModel {
  final String? calculationMethod;
  final String? displayName;
  final String? name;
  final String? type;
  final MxTerminalTipRateModel? rate;

  MxTerminalTipOptionModel({this.calculationMethod, this.displayName, this.name, this.rate, this.type});

  Map<String, dynamic> toJson() {
    return {'rate': rate?.toJson(), 'calculationMethod': calculationMethod, 'displayName': displayName, 'name': name, 'type': type}
      ..removeWhere((_, v) => v == null);
  }

  factory MxTerminalTipOptionModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTipOptionModel(
      rate: json['rate'] != null ? MxTerminalTipRateModel.fromJson(Map<String, dynamic>.from(json['rate'])) : null,
      calculationMethod: json['calculationMethod'],
      displayName: json['displayName']?.toString(),
      name: json['name']?.toString(),
      type: json['type'],
    );
  }
}
