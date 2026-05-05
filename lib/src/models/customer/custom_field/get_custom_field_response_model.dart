import 'package:mx_merchant/mx_merchant.dart';

class MxGetCustomFieldResponseModel {
  /// Field definition ID (Integer type)
  final int fieldDefinitionId;

  /// Name of the field definition
  final String fieldDefinitionName;

  /// Type of field.
  final MxCustomFieldDataTypeEnum fieldDataType;

  /// System Level Field (True by default)
  final bool isSystem;

  /// Whether the custom field is required to fill out (True by default)
  final bool isRequired;

  /// Custom field ID (Integer type)
  final int id;

  /// Customer ID associated with the field
  final int customerId;

  /// Options for the custom field (Empty object in example)
  final List<MxCustomFieldOptionModel> options;

  MxGetCustomFieldResponseModel({
    this.fieldDefinitionId = 0,
    required this.fieldDefinitionName,
    required this.fieldDataType,
    this.isSystem = true,
    this.isRequired = true,
    this.id = 0,
    this.customerId = 0,
    this.options = const [],
  });

  factory MxGetCustomFieldResponseModel.fromJson(Map<String, dynamic> json) {
    return MxGetCustomFieldResponseModel(
      fieldDefinitionId: json['fieldDefinitionId'] ?? 0,
      fieldDefinitionName: json['fieldDefinitionName'] ?? '',
      fieldDataType: MxCustomFieldDataTypeEnum.values.firstWhere((e) => e.name == json['fieldDataType']),
      isSystem: json['isSystem'] ?? true,
      isRequired: json['isRequired'] ?? true,
      id: json['id'] ?? 0,
      customerId: json['customerId'] ?? 0,
      options: json['options'] != null ? MxCustomFieldOptionModel.fromJsonArray(json['options']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fieldDefinitionId': fieldDefinitionId,
      'fieldDefinitionName': fieldDefinitionName,
      'fieldDataType': fieldDataType.name,
      'isSystem': isSystem,
      'isRequired': isRequired,
      'id': id,
      'customerId': customerId,
      'options': options.map((e) => e.toJson()).toList(),
    }..removeWhere((_, v) => v == null);
  }

  static List<MxGetCustomFieldResponseModel> fromJsonArray(List array) => array.map((e) => MxGetCustomFieldResponseModel.fromJson(e)).toList();
}
