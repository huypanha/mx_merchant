import 'package:collection/collection.dart';
import 'package:mx_merchant/mx_merchant.dart';

class MxCreateCustomerResponseModel {
  final int id;
  final String? created;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? number;
  final String? taxId;
  final int visits;
  final int transactionCount;
  final String? spend;
  final String? sales;
  final String? refunds;
  final String? lastActivity;
  final bool allowPromotions;
  final String? loyaltyStatus;
  final String? loyaltyEnrolled;
  final bool isVip;
  final String? spendProfile;
  final String? spendProfileIcon;
  final String? addressName;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? zip;
  final MxCustomerTypeEnum customerType;
  final bool spendProfileOverride;
  final bool isTaxExempt;
  final bool hasPayments;
  final bool hasContracts;
  final bool hasInvoices;
  final String? displayColor;
  final bool activeStatus;
  final String? email;
  final String? mobile;
  final String? phone;
  final List<MxCustomerCustomFieldModel>? customFields;
  String? selectedSpendProfile;

  MxCreateCustomerResponseModel({
    this.id = 0,
    this.created,
    this.name,
    this.firstName,
    this.lastName,
    this.number,
    this.taxId,
    this.visits = 0,
    this.transactionCount = 0,
    this.spend,
    this.sales,
    this.refunds,
    this.lastActivity,
    this.allowPromotions = true,
    this.loyaltyStatus,
    this.loyaltyEnrolled,
    this.isVip = true,
    this.spendProfile,
    this.spendProfileIcon,
    this.addressName,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.customerType = .person,
    this.spendProfileOverride = true,
    this.isTaxExempt = true,
    this.hasPayments = true,
    this.hasContracts = true,
    this.hasInvoices = true,
    this.displayColor,
    this.activeStatus = true,
    this.email,
    this.mobile,
    this.phone,
    this.customFields,
    this.selectedSpendProfile,
  });

  factory MxCreateCustomerResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCreateCustomerResponseModel(
      id: json['id'] ?? 0,
      created: json['created'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      number: json['number'],
      taxId: json['taxId'],
      visits: json['visits'] ?? 0,
      transactionCount: json['transactionCount'] ?? 0,
      spend: json['spend'],
      sales: json['sales'],
      refunds: json['refunds'],
      lastActivity: json['lastActivity'],
      allowPromotions: json['allowPromotions'] ?? true,
      loyaltyStatus: json['loyaltyStatus'],
      loyaltyEnrolled: json['loyaltyEnrolled'],
      isVip: json['isVip'] ?? true,
      spendProfile: json['spendProfile'],
      spendProfileIcon: json['spendProfileIcon'],
      addressName: json['addressName'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      customerType: MxCustomerTypeEnum.values.firstWhereOrNull((e) => e.name == json['customerType']) ?? MxCustomerTypeEnum.person,
      spendProfileOverride: json['spendProfileOverride'] ?? true,
      isTaxExempt: json['isTaxExempt'] ?? true,
      hasPayments: json['hasPayments'] ?? true,
      hasContracts: json['hasContracts'] ?? true,
      hasInvoices: json['hasInvoices'] ?? true,
      displayColor: json['displayColor'],
      activeStatus: json['activeStatus'] ?? true,
      email: json['email'],
      mobile: json['mobile'],
      phone: json['phone'],
      customFields: json['customFields'] != null ? MxCustomerCustomFieldModel.fromJsonArray(json['customFields']) : null,
      selectedSpendProfile: json['selectedSpendProfile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created': created,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'number': number,
      'taxId': taxId,
      'visits': visits,
      'transactionCount': transactionCount,
      'spend': spend,
      'sales': sales,
      'refunds': refunds,
      'lastActivity': lastActivity,
      'allowPromotions': allowPromotions,
      'loyaltyStatus': loyaltyStatus,
      'loyaltyEnrolled': loyaltyEnrolled,
      'isVip': isVip,
      'spendProfile': spendProfile,
      'spendProfileIcon': spendProfileIcon,
      'addressName': addressName,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'zip': zip,
      'customerType': customerType.name,
      'spendProfileOverride': spendProfileOverride,
      'isTaxExempt': isTaxExempt,
      'hasPayments': hasPayments,
      'hasContracts': hasContracts,
      'hasInvoices': hasInvoices,
      'displayColor': displayColor,
      'activeStatus': activeStatus,
      'email': email,
      'mobile': mobile,
      'phone': phone,
      'customFields': customFields?.map((e) => e.toJson()).toList(),
      'selectedSpendProfile': selectedSpendProfile,
    }..removeWhere((_, v) => v == null);
  }

  MxCreateCustomerResponseModel copyWith({
    int? id,
    String? created,
    String? name,
    String? firstName,
    String? lastName,
    String? number,
    String? taxId,
    int? visits,
    int? transactionCount,
    String? spend,
    String? sales,
    String? refunds,
    String? lastActivity,
    bool? allowPromotions,
    String? loyaltyStatus,
    String? loyaltyEnrolled,
    bool? isVip,
    String? spendProfile,
    String? spendProfileIcon,
    String? addressName,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? zip,
    MxCustomerTypeEnum? customerType,
    bool? spendProfileOverride,
    bool? isTaxExempt,
    bool? hasPayments,
    bool? hasContracts,
    bool? hasInvoices,
    String? displayColor,
    bool? activeStatus,
    String? email,
    String? mobile,
    String? phone,
    List<MxCustomerCustomFieldModel>? customFields,
    String? selectedSpendProfile,
  }) {
    return MxCreateCustomerResponseModel(
      id: id ?? this.id,
      created: created ?? this.created,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      number: number ?? this.number,
      taxId: taxId ?? this.taxId,
      visits: visits ?? this.visits,
      transactionCount: transactionCount ?? this.transactionCount,
      spend: spend ?? this.spend,
      sales: sales ?? this.sales,
      refunds: refunds ?? this.refunds,
      lastActivity: lastActivity ?? this.lastActivity,
      allowPromotions: allowPromotions ?? this.allowPromotions,
      loyaltyStatus: loyaltyStatus ?? this.loyaltyStatus,
      loyaltyEnrolled: loyaltyEnrolled ?? this.loyaltyEnrolled,
      isVip: isVip ?? this.isVip,
      spendProfile: spendProfile ?? this.spendProfile,
      spendProfileIcon: spendProfileIcon ?? this.spendProfileIcon,
      addressName: addressName ?? this.addressName,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      customerType: customerType ?? this.customerType,
      spendProfileOverride: spendProfileOverride ?? this.spendProfileOverride,
      isTaxExempt: isTaxExempt ?? this.isTaxExempt,
      hasPayments: hasPayments ?? this.hasPayments,
      hasContracts: hasContracts ?? this.hasContracts,
      hasInvoices: hasInvoices ?? this.hasInvoices,
      displayColor: displayColor ?? this.displayColor,
      activeStatus: activeStatus ?? this.activeStatus,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      phone: phone ?? this.phone,
      customFields: customFields ?? this.customFields,
      selectedSpendProfile: selectedSpendProfile ?? this.selectedSpendProfile,
    );
  }

  MxCreateCustomerRequestModel toRequestModel() {
    return MxCreateCustomerRequestModel.fromJson(toJson());
  }
}
