import 'package:mx_merchant/src/models/customer/custom_field/create_custom_field_request_model.dart';
import 'package:mx_merchant/src/models/customer/custom_field/create_custom_field_response_model.dart';
import 'package:mx_merchant/src/models/customer/custom_field/get_custom_field_response_model.dart';

abstract class MxCustomFieldService {
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/create-custom-fields-for-customers
  Future<MxCreateCustomFieldResponseModel> create(MxCreateCustomFieldRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-custom-fields-for-customers
  Future<List<MxGetCustomFieldResponseModel>> get(String customerId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/delete-custom-fields-for-customers
  Future<bool> delete(int fieldId) async {
    throw UnimplementedError();
  }
}
