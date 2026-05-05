import 'package:mx_merchant/src/models/terminal/tip_option_model.dart';

class MxTerminalTipModel {
  /// Allow Tip
  final bool allow;

  /// Allow Custom
  final bool allowCustom;

  /// Options
  final List<MxTerminalTipOptionModel>? options;

  MxTerminalTipModel({this.allow = false, this.allowCustom = false, this.options});

  Map<String, dynamic> toJson() {
    return {'allow': allow, 'allowCustom': allowCustom, 'options': options?.map((e) => e.toJson()).toList()}..removeWhere((_, v) => v == null);
  }

  factory MxTerminalTipModel.fromJson(Map<String, dynamic> map) {
    return MxTerminalTipModel(
      allow: map['allow'] ?? false,
      allowCustom: map['allowCustom'] ?? false,
      options: map['options'] != null
          ? (map['options'] as List).map((e) => MxTerminalTipOptionModel.fromJson(Map<String, dynamic>.from(e))).toList()
          : null,
    );
  }
}
