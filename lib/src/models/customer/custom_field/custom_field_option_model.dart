class MxCustomFieldOptionModel {
  /// Name of Option
  final String name;

  /// Value (same as name)
  final String value;

  MxCustomFieldOptionModel({required this.name, required this.value});

  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value};
  }

  factory MxCustomFieldOptionModel.fromJson(Map<String, dynamic> json) {
    return MxCustomFieldOptionModel(name: json['name'], value: json['value']);
  }

  static List<MxCustomFieldOptionModel> fromJsonArray(List array) => array.map((e) => MxCustomFieldOptionModel.fromJson(e)).toList();
}
