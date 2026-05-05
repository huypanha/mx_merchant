import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/customer_service.dart';
import 'package:mx_merchant/src/services/customer_service_impl.dart';
import 'package:mx_merchant/src/services/payment_service.dart';
import 'package:mx_merchant/src/services/payment_service_impl.dart';
import 'package:mx_merchant/src/services/terminal_service.dart';
import 'package:mx_merchant/src/services/terminal_service_impl.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxMerchant {
  late ApiService _apiService;
  late MxPaymentService payment;
  late MxTerminalService terminal;
  late MxCustomerService customer;

  MxMerchant({required String consumerKey, required String consumerSecret, required String merchantId, MxMerchantEnvironmentEnum env = .sandbox}) {
    _apiService = ApiService(consumerKey: consumerKey, consumerSecret: consumerSecret, env: env, merchantId: merchantId);
    payment = MxPaymentServiceImpl(_apiService);
    terminal = MxTerminalServiceImpl(_apiService);
    customer = MxCustomerServiceImpl(_apiService);
  }
}
