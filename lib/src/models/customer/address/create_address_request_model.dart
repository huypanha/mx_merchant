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

  /// If you would like to get the response object, you should supply `echo = true` as a URL parameter.
  /// This is useful as it keeps the user from having to use a GET call to see the response object information.
  final bool echo;

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
    this.echo = true,
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
    return {'id': customerId, 'echo': echo, 'subId': addressId};
  }
}
