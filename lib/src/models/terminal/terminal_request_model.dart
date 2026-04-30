import 'package:mx_merchant/src/models/terminal/terminal_entry_mode_model.dart';
import 'package:mx_merchant/src/models/terminal/terminal_key_model.dart';
import 'package:mx_merchant/src/models/terminal/terminal_payment_method_model.dart';
import 'package:mx_merchant/src/models/terminal/tip_model.dart';

class MxTerminalRequestModel {
  final String providerKey;

  /// Enable Terminal
  final bool enabled;

  /// Default model
  final String? defaultModel;

  /// Name
  final String? name;

  /// Description
  final String? description;

  final String status;

  /// Tip object
  final MxTerminalTipModel? tip;

  /// Entry Modes
  final MxTerminalEntryModeModel? entryModes;

  /// Payment Methods
  final MxTerminalPaymentMethodModel? paymentMethods;

  /// Key Fields
  final MxTerminalKeyModel? key;

  /// External Source
  final String? externalSource;

  /// External Id
  final String? externalId;

  MxTerminalRequestModel({
    required this.providerKey,
    this.enabled = false,
    this.tip,
    this.entryModes,
    this.paymentMethods,
    this.defaultModel,
    this.name,
    this.description,
    this.status = 'ACTIVE',
    this.key,
    this.externalSource,
    this.externalId,
  });

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'tip': tip?.toJson(),
      'entryModes': entryModes?.toJson(),
      'paymentMethods': paymentMethods?.toJson(),
      'defaultModel': defaultModel,
      'name': name,
      'description': description,
      'status': status,
      'key': key?.toJson(),
      'externalSource': externalSource,
      'externalId': externalId,
    }..removeWhere((_, v) => v == null);
  }
}
