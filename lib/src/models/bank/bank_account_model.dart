import 'package:collection/collection.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxBankAccountModel {
  /// Account Number
  final String? accountNumber;

  /// Routing Number
  final String? routingNumber;

  /// Account Type.
  final MxBankAccountType? type;

  /// Account holder's name
  final String? name;

  /// Alias or common name used to refer to this account
  final String? alias;

  /// Is this the default account
  final bool? isDefault;

  /// Check number
  final String? checkNumber;

  /// Sets the ACH individual id. Customer Number.
  final String? individualId;

  /// Tokenized reference used to relay secure bankAccount information.
  final String? token;

  const MxBankAccountModel({
    this.accountNumber,
    this.routingNumber,
    this.type,
    this.name,
    this.alias,
    this.isDefault,
    this.checkNumber,
    this.individualId,
    this.token,
  });

  Map<String, dynamic> toJson() => {
    'accountNumber': accountNumber,
    'routingNumber': routingNumber,
    'type': type?.name,
    'name': name,
    'alias': alias,
    'isDefault': isDefault,
    'checkNumber': checkNumber,
    'individualId': individualId,
    'token': token,
  }..removeWhere((_, value) => value == null);

  factory MxBankAccountModel.fromJson(Map<String, dynamic> json) {
    return MxBankAccountModel(
      accountNumber: json['accountNumber'],
      routingNumber: json['routingNumber'],
      type: json['type'] != null ? MxBankAccountType.values.firstWhereOrNull((e) => e.name == json['type']) : null,
      name: json['name'],
      alias: json['alias'],
      isDefault: json['isDefault'] != null ? bool.tryParse(json['isDefault'].toString()) : null,
      checkNumber: json['checkNumber'],
      individualId: json['individualId'],
      token: json['token'],
    );
  }
}
