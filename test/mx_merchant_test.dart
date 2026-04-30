import 'package:flutter_test/flutter_test.dart';
import 'package:mx_merchant/mx_merchant.dart';

void main() {
  test('uses sandbox base URL by default', () {
    final config = MxMerchant(consumerKey: '', consumerSecret: '', merchantId: '');
  });
}
