class MxMerchantException implements Exception {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? response;

  const MxMerchantException({required this.statusCode, required this.message, this.response});

  @override
  String toString() {
    return 'MxMerchantException($statusCode): $message';
  }
}
