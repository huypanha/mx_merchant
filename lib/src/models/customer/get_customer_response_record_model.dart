import 'package:collection/collection.dart';

import '../../utils/enums.dart';

class MxGetCustomerRecordModel {
  final int id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? number;
  final String? email;
  final MxDurationOption? lastActivity;
  final bool allowPromotions;
  final String? spendProfile;
  final String? spendProfileIcon;
  final String? customerType;
  final bool isTaxExempt;
  final String? displayColor;
  final bool activeStatus;

  MxGetCustomerRecordModel({
    this.id = 0,
    this.name,
    this.firstName,
    this.lastName,
    this.number,
    this.email,
    this.lastActivity,
    this.allowPromotions = true,
    this.spendProfile,
    this.spendProfileIcon,
    this.customerType,
    this.isTaxExempt = true,
    this.displayColor,
    this.activeStatus = true,
  });

  factory MxGetCustomerRecordModel.fromJson(Map<String, dynamic> json) {
    return MxGetCustomerRecordModel(
      id: json['id'] ?? 0,
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      number: json['number'],
      email: json['email'],
      lastActivity: json['lastActivity'] != null ? MxDurationOption.values.firstWhereOrNull((e) => e.name == json['lastActivity']) : null,
      allowPromotions: json['allowPromotions'] ?? true,
      spendProfile: json['spendProfile'],
      spendProfileIcon: json['spendProfileIcon'],
      customerType: json['customerType'],
      isTaxExempt: json['isTaxExempt'] ?? true,
      displayColor: json['displayColor'],
      activeStatus: json['activeStatus'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'number': number,
      'email': email,
      'lastActivity': lastActivity?.name,
      'allowPromotions': allowPromotions,
      'spendProfile': spendProfile,
      'spendProfileIcon': spendProfileIcon,
      'customerType': customerType,
      'isTaxExempt': isTaxExempt,
      'displayColor': displayColor,
      'activeStatus': activeStatus,
    }..removeWhere((_, v) => v == null);
  }
}
