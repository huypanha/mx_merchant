class MxCreateCustomerAddressRequestModel {
  /// Customer id to create this address for
  final int customerId;

  /// Address id to be updated
  final int? addressId;

  /// Name of address
  final String? name;

  /// Street address
  final String? address1;

  /// Apartment, suite, or department
  final String? address2;

  /// City
  final String? city;

  /// State
  final String? state;

  /// Zip code
  final String? zip;

  /// Country
  final String? country;

  /// Is this the default address
  final bool isDefault;

  MxCreateCustomerAddressRequestModel({
    required this.customerId,
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.isDefault = true,
    this.addressId,
  });

  Map<String, dynamic> toBodyJson() {
    return {
      'name': name,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
      'isDefault': isDefault,
    }..removeWhere((_, v) => v == null);
  }

  Map<String, dynamic> toQueryJson() {
    return {'id': customerId, 'echo': true, 'subId': addressId};
  }

  factory MxCreateCustomerAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return MxCreateCustomerAddressRequestModel(
      customerId: int.tryParse(json['customerId'].toString()) ?? 0,
      addressId: json['id'],
      name: json['name'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      zip: json['zip']?.toString(),
      country: json['country'],
      isDefault: bool.tryParse(json['isDefault'].toString()) ?? true,
    );
  }

  MxCreateCustomerAddressRequestModel copyWith({
    int? customerId,
    int? addressId,
    String? name,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? zip,
    String? country,
    bool? isDefault,
  }) {
    return MxCreateCustomerAddressRequestModel(
      customerId: customerId ?? this.customerId,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
