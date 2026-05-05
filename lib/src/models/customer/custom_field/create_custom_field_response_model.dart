import 'package:mx_merchant/src/models/customer/custom_field/custom_field_option_model.dart';

import '../../../utils/enums.dart';

class MxCreateCustomFieldResponseModel {
  /// Id for the custom field (Integer type)
  final int id;

  /// Name for the custom field object
  final String fieldName;

  /// Type of field.
  final MxCustomFieldDataTypeEnum fieldDataType;

  /// Always customer. Example: "Customer"
  final String fieldSourceType;

  /// System Level Field (True by default)
  final bool isSystem;

  /// System level field (True by default)
  final bool isDeleted;

  /// Whether the custom field is required to fill out (True by default)
  final bool isRequired;

  /// Options for the custom field
  final List<MxCustomFieldOptionModel> options;

  MxCreateCustomFieldResponseModel({
    this.id = 0,
    required this.fieldName,
    required this.fieldDataType,
    required this.fieldSourceType,
    this.isSystem = true,
    this.isDeleted = true,
    this.isRequired = true,
    this.options = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fieldName': fieldName,
      'fieldDataType': fieldDataType.name,
      'fieldSourceType': fieldSourceType,
      'isSystem': isSystem,
      'isDeleted': isDeleted,
      'isRequired': isRequired,
      'options': options,
    }..removeWhere((_, v) => v == null);
  }

  factory MxCreateCustomFieldResponseModel.fromJson(Map<String, dynamic> map) {
    return MxCreateCustomFieldResponseModel(
      id: int.tryParse(map['id'].toString()) ?? 0,
      fieldName: map['fieldName'],
      fieldDataType: MxCustomFieldDataTypeEnum.values.firstWhere((e) => e.name == map['fieldDataType']),
      fieldSourceType: map['fieldSourceType'],
      isSystem: bool.tryParse(map['isSystem'].toString()) ?? true,
      isDeleted: bool.tryParse(map['isDeleted'].toString()) ?? true,
      isRequired: bool.tryParse(map['isRequired'].toString()) ?? true,
      options: MxCustomFieldOptionModel.fromJsonArray(map['options']),
    );
  }
}
