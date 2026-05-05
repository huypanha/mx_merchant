import '../../../utils/enums.dart';

class MxTerminalCreateTransactionRequestModel {
  /// The MX Merchant terminal ID.
  final String terminalId;

  /// Amount
  final double amount;

  final MxPaymentTransactionTypeEnum type;

  /// Vault Card
  final bool vaultCard;

  /// Unique 15 digit string only.
  final String? replayId;

  MxTerminalCreateTransactionRequestModel({required this.terminalId, this.amount = 0.01, this.type = .sale, this.vaultCard = false, this.replayId})
    : assert(replayId == null || RegExp(r'^\d{15}$').hasMatch(replayId), 'Replay ID must be a 15-digit string');

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'type': type.name, 'vaultCard': vaultCard, 'replayId': replayId}..removeWhere((_, v) => v == null);
  }
}
