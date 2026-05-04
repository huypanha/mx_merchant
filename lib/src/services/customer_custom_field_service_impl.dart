import 'package:mx_merchant/src/models/customer/custom_field/create_custom_field_request_model.dart';
import 'package:mx_merchant/src/models/customer/custom_field/create_custom_field_response_model.dart';
import 'package:mx_merchant/src/models/customer/custom_field/get_custom_field_response_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/customer_custom_field_service.dart';
import 'package:mx_merchant/src/utils/mx_merchant_exception.dart';

class MxCustomFieldServiceImpl implements MxCustomFieldService {
  late ApiService _apiService;
  final String _route = 'checkout/v3';

  MxCustomFieldServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<MxCreateCustomFieldResponseModel> create(MxCreateCustomFieldRequestModel request) async {
    final query = request.toQueryJson();
    query['merchantId'] = _apiService.merchantId;
    final response = await _apiService.post('$_route/field', data: request.toBodyJson(), query: query);
    if (response.statusCode == 201) {
      return MxCreateCustomFieldResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<List<MxGetCustomFieldResponseModel>> get(String customerId) async {
    final response = await _apiService.post('$_route/customer/field', query: {'id': customerId});
    if (response.statusCode == 200) {
      return MxGetCustomFieldResponseModel.fromJsonArray(response.data);
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<bool> delete(int fieldId) async {
    final response = await _apiService.delete('$_route/field/$fieldId');
    if (response.statusCode == 200) {
      return true;
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }
}
