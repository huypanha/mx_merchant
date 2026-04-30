import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/payment_service.dart';
import 'package:mx_merchant/src/services/payment_service_impl.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxMerchant {
  late ApiService _apiService;
  late MxPaymentService payment;

  MxMerchant({required String consumerKey, required String consumerSecret, required String merchantId, MxMerchantEnvironment env = .sandbox}) {
    _apiService = ApiService(consumerKey: consumerKey, consumerSecret: consumerSecret, env: env, merchantId: merchantId);
    payment = MxPaymentServiceImpl(_apiService);
  }
}
