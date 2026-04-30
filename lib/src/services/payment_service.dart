import 'package:mx_merchant/src/models/payment/get_payment_request_model.dart';
import 'package:mx_merchant/src/models/payment/payment_response_model.dart';

import '../models/payment/get_a_payment_response_model.dart';
import '../models/payment/get_payment_response_model.dart';
import '../models/payment/payment_request_model.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/payment-overview-1
abstract class MxPaymentService {
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/post-payment
  Future<MxPaymentResponseModel> makePayment(MxPaymentRequestModel payment) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-payment
  Future<MxGetPaymentResponseModel> getPayments(MxGetPaymentRequestModel payment) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-a-payment
  /// * [paymentId]: The ID of the payment to retrieve
  /// * [includeCustomer]: Whether to include the customer information in the response
  Future<MxGetAPaymentResponseModel> getAPayment(String paymentId, {bool includeCustomer = true}) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/void-a-payment
  /// * [paymentId]: The id of the payment
  /// * [force]: Force a refund if transaction has already settled
  Future<bool> voidAPayment(String paymentId, {bool? force}) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/send-a-payment-receipt
  /// * [paymentId]: The id of the payment
  /// * [contact]: For email provide email address and for text provide phone number
  /// * [force]: Force a refund if transaction has already settled
  Future<bool> sendAPaymentReceipt({required String paymentId, required String contact, bool? ignoreBcc}) async {
    throw UnimplementedError();
  }
}
