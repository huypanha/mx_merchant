import 'package:mx_merchant/src/models/customer/address/create_address_request_model.dart';
import 'package:mx_merchant/src/models/customer/address/create_address_response_model.dart';
import 'package:mx_merchant/src/models/customer/create_customer_request_model.dart';
import 'package:mx_merchant/src/models/customer/customer_note_model.dart';
import 'package:mx_merchant/src/models/customer/get_customer_request_model.dart';
import 'package:mx_merchant/src/models/customer/get_customer_response_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/customer_service.dart';

import '../models/customer/create_customer_response_model.dart';
import '../models/customer/customer_payment_response_model.dart';
import '../utils/throw_error.dart';
import 'customer_custom_field_service.dart';
import 'customer_custom_field_service_impl.dart';

class MxCustomerServiceImpl implements MxCustomerService {
  late ApiService _apiService;
  final String _route = 'checkout/v3/customer';

  MxCustomerServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  MxCustomFieldService get customField => MxCustomFieldServiceImpl(_apiService);

  @override
  Future<MxCreateCustomerResponseModel> create(MxCreateCustomerRequestModel request) async {
    final data = request.toBodyJson();
    data['merchantId'] = _apiService.merchantId;
    final response = await _apiService.post(_route, data: data, query: request.toQueryJson());
    if (response.statusCode == 201) {
      return MxCreateCustomerResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxGetCustomerResponseModel> get(MxGetCustomerRequestModel request) async {
    final data = request.toJson();
    data['merchantId'] = _apiService.merchantId;
    final response = await _apiService.get(_route, query: data);
    if (response.statusCode == 200) {
      return MxGetCustomerResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxCreateCustomerResponseModel> getACustomer(int customerId) async {
    final response = await _apiService.get('$_route/$customerId');
    if (response.statusCode == 200) {
      return MxCreateCustomerResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxCreateCustomerResponseModel> update({required int customerId, required MxCreateCustomerRequestModel customerData}) async {
    final data = customerData.toBodyJson();
    data['merchantId'] = _apiService.merchantId;
    final response = await _apiService.put('$_route/$customerId', data: data);
    if (response.statusCode == 201) {
      return MxCreateCustomerResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<List<MxCreateCustomerAddressResponseModel>> createAddress(MxCreateCustomerAddressRequestModel request) async {
    final response = await _apiService.post('${_route}address', data: request.toBodyJson(), query: request.toQueryJson());
    if (response.statusCode == 200) {
      return MxCreateCustomerAddressResponseModel.fromJsonArray(response.data);
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<List<MxCreateCustomerAddressResponseModel>> getAddress(int customerId) async {
    final response = await _apiService.get('${_route}address/$customerId');
    if (response.statusCode == 200) {
      return MxCreateCustomerAddressResponseModel.fromJsonArray(response.data);
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxCreateCustomerAddressResponseModel> updateAddress(MxCreateCustomerAddressRequestModel request) async {
    final response = await _apiService.put('${_route}address', data: request.toBodyJson(), query: request.toQueryJson());
    if (response.statusCode == 200) {
      return MxCreateCustomerAddressResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<bool> addNote({required int customerId, required String note}) async {
    final response = await _apiService.post('${_route}note', data: {'text': note}, query: {'id': customerId});
    if (response.statusCode == 201) {
      return true;
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<List<MxCustomerNoteModel>> getNote(int customerId) async {
    final response = await _apiService.get('${_route}note', query: {'id': customerId});
    if (response.statusCode == 200) {
      return MxCustomerNoteModel.fromJsonArray(response.data);
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxCustomerPaymentResponseModel> getPayments({required int customerId, required int offset, required int limit}) async {
    final response = await _apiService.get(
      '${_route}payment',
      query: {'id': customerId, 'merchantId': _apiService.merchantId, 'offset': offset, 'limit': limit},
    );
    if (response.statusCode == 200) {
      return MxCustomerPaymentResponseModel.fromJson(response.data);
    } else {
      throw errorParser(response);
    }
  }
}
