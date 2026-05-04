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
  final String? customerType;
  final bool spendProfileOverride;
  final bool isTaxExempt;
  final bool hasPayments;
  final bool hasContracts;
  final bool hasInvoices;
  final String? displayColor;
  final bool activeStatus;

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
    this.customerType,
    this.spendProfileOverride = true,
    this.isTaxExempt = true,
    this.hasPayments = true,
    this.hasContracts = true,
    this.hasInvoices = true,
    this.displayColor,
    this.activeStatus = true,
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
      customerType: json['customerType'],
      spendProfileOverride: json['spendProfileOverride'] ?? true,
      isTaxExempt: json['isTaxExempt'] ?? true,
      hasPayments: json['hasPayments'] ?? true,
      hasContracts: json['hasContracts'] ?? true,
      hasInvoices: json['hasInvoices'] ?? true,
      displayColor: json['displayColor'],
      activeStatus: json['activeStatus'] ?? true,
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
      'customerType': customerType,
      'spendProfileOverride': spendProfileOverride,
      'isTaxExempt': isTaxExempt,
      'hasPayments': hasPayments,
      'hasContracts': hasContracts,
      'hasInvoices': hasInvoices,
      'displayColor': displayColor,
      'activeStatus': activeStatus,
    }..removeWhere((_, v) => v == null);
  }
}
