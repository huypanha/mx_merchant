class MxCustomerResponseModel {
  final int id;
  final String? created;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? number;
  final String? sales;
  final String? loyaltyStatus;
  final String? loyaltyEnrolled;
  final List<Map<String, dynamic>> customFields;
  final String? displayColor;

  const MxCustomerResponseModel({
    this.id = 0,
    this.created,
    this.name,
    this.firstName,
    this.lastName,
    this.number,
    this.sales,
    this.loyaltyStatus,
    this.loyaltyEnrolled,
    this.customFields = const [],
    this.displayColor,
  });

  factory MxCustomerResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCustomerResponseModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      created: json['created'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      number: json['number'],
      sales: json['sales'],
      loyaltyStatus: json['loyaltyStatus'],
      loyaltyEnrolled: json['loyaltyEnrolled'],
      customFields: List.from(json['customFields'] ?? []).map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      displayColor: json['displayColor'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'created': created,
    'name': name,
    'firstName': firstName,
    'lastName': lastName,
    'number': number,
    'sales': sales,
    'loyaltyStatus': loyaltyStatus,
    'loyaltyEnrolled': loyaltyEnrolled,
    'customFields': customFields,
    'displayColor': displayColor,
  }..removeWhere((_, value) => value == null);
}
