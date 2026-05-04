class MxPurchaseModel {
  final String? code;
  final String? description;
  final double? unitPrice;
  final int? quantity;
  final String? unitOfMeasure;
  final double? taxRate;
  final double? taxAmount;
  final double? discountRate;
  final double? discountAmount;
  final double? extendedAmount;

  const MxPurchaseModel({
    this.code,
    this.description,
    this.unitPrice,
    this.quantity,
    this.unitOfMeasure,
    this.taxRate,
    this.taxAmount,
    this.discountRate,
    this.discountAmount,
    this.extendedAmount,
  });

  Map<String, dynamic> toJson() => {
    'code': code,
    'description': description,
    'unitPrice': unitPrice,
    'quantity': quantity,
    'unitOfMeasure': unitOfMeasure,
    'taxRate': taxRate,
    'taxAmount': taxAmount,
    'discountRate': discountRate,
    'discountAmount': discountAmount,
    'extendedAmount': extendedAmount,
  }..removeWhere((_, value) => value == null);

  factory MxPurchaseModel.fromJson(Map<String, dynamic> json) {
    return MxPurchaseModel(
      code: json['code'],
      description: json['description'],
      unitPrice: json['unitPrice'] != null ? double.tryParse(json['unitPrice'].toString()) : null,
      quantity: json['quantity'] != null ? int.tryParse(json['unitPrice'].toString()) : null,
      unitOfMeasure: json['unitOfMeasure'],
      taxRate: json['taxRate'] != null ? double.tryParse(json['taxRate'].toString()) : null,
      taxAmount: json['taxAmount'] != null ? double.tryParse(json['taxAmount'].toString()) : null,
      discountRate: json['discountRate'] != null ? double.tryParse(json['discountRate'].toString()) : null,
      discountAmount: json['discountAmount'] != null ? double.tryParse(json['discountAmount'].toString()) : null,
      extendedAmount: json['extendedAmount'] != null ? double.tryParse(json['extendedAmount'].toString()) : null,
    );
  }

  static List<MxPurchaseModel> fromJsonArray(List data) => data.map((e) => MxPurchaseModel.fromJson(e)).toList();
}
