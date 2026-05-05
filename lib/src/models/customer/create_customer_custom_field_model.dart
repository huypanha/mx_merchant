import '../../utils/enums.dart';

class MxCustomerCustomFieldModel {
  /// Field Data type of your custom Field.
  final MxCustomFieldDataTypeEnum? fieldDataType;

  /// Id of field
  final int? fieldDefinitionId;

  /// Is this field Required
  final bool? isRequired;

  /// Field Name
  final String? name;

  /// Value for field
  final String? value;

  MxCustomerCustomFieldModel({this.fieldDataType, this.fieldDefinitionId, this.isRequired, this.name, this.value});

  Map<String, dynamic> toJson() {
    return {'fieldDataType': fieldDataType?.name, 'fieldDefinitionId': fieldDefinitionId, 'isRequired': isRequired, 'name': name, 'value': value}
      ..removeWhere((_, v) => v == null);
  }
}
