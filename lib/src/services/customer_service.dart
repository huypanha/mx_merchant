import 'package:mx_merchant/src/models/customer/address/create_address_request_model.dart';
import 'package:mx_merchant/src/models/customer/address/create_address_response_model.dart';
import 'package:mx_merchant/src/models/customer/create_customer_request_model.dart';
import 'package:mx_merchant/src/models/customer/create_customer_response_model.dart';
import 'package:mx_merchant/src/models/customer/customer_note_model.dart';
import 'package:mx_merchant/src/models/customer/customer_payment_response_model.dart';
import 'package:mx_merchant/src/models/customer/get_customer_request_model.dart';
import 'package:mx_merchant/src/models/customer/get_customer_response_model.dart';

import 'customer_custom_field_service.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/customers-overview
abstract class MxCustomerService {
  /// Manage customer custom fields
  MxCustomFieldService get customField;

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/create-customer
  Future<MxCreateCustomerResponseModel> create(MxCreateCustomerRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/customer
  Future<MxGetCustomerResponseModel> get(MxGetCustomerRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-a-customer
  Future<MxCreateCustomerResponseModel> getACustomer(int customerId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/update-customer
  Future<MxCreateCustomerResponseModel> update({required int customerId, required MxCreateCustomerRequestModel customerData}) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/create-a-customers-address
  Future<List<MxCreateCustomerAddressResponseModel>> createAddress(MxCreateCustomerAddressRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-a-customers-address
  Future<List<MxCreateCustomerAddressResponseModel>> getAddress(int customerId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/update-a-customers-address
  Future<MxCreateCustomerAddressResponseModel> updateAddress(MxCreateCustomerAddressRequestModel request) async {
    throw UnimplementedError();
  }

  /// * customerId: The ID of the customer to add a note to
  /// * note: The note to add, must be between 1 and 256 characters
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/add-a-customer-note
  Future<bool> addNote({required int customerId, required String note}) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/add-a-customer-note-1
  Future<List<MxCustomerNoteModel>> getNote(int customerId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-customer-payments
  Future<MxCustomerPaymentResponseModel> getPayments({required int customerId, required int offset, required int limit}) async {
    throw UnimplementedError();
  }
}
