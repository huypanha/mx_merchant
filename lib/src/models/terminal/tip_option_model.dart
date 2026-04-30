import 'package:mx_merchant/src/models/terminal/terminal_tip_rate_model.dart';

class MxTerminalTipOptionModel {
  final MxTerminalTipRateModel? rate;

  MxTerminalTipOptionModel({this.rate});

  Map<String, dynamic> toJson() {
    return {'rate': rate?.toJson()}..removeWhere((_, v) => v == null);
  }
}
