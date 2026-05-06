import 'package:mx_merchant/src/models/customer/address/create_address_request_model.dart';

class MxCreateCustomerAddressResponseModel {
  final int id;
  final String? name;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? zip;
  final String? created;
  final bool isDefault;

  MxCreateCustomerAddressResponseModel({
    this.id = 0,
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.created,
    this.isDefault = true,
  });

  factory MxCreateCustomerAddressResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCreateCustomerAddressResponseModel(
      id: json['id'] ?? 0,
      name: json['name'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      created: json['created'],
      isDefault: json['isDefault'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'zip': zip,
      'created': created,
      'isDefault': isDefault,
    }..removeWhere((_, v) => v == null);
  }

  static List<MxCreateCustomerAddressResponseModel> fromJsonArray(List array) =>
      array.map((e) => MxCreateCustomerAddressResponseModel.fromJson(Map<String, dynamic>.from(e))).toList();

  MxCreateCustomerAddressRequestModel toRequestModel() {
    return MxCreateCustomerAddressRequestModel.fromJson(toJson());
  }
}
