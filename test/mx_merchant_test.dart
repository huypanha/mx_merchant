import 'package:flutter_test/flutter_test.dart';
import 'package:mx_merchant/mx_merchant.dart';

void main() {
  group('Payment Service Models', () {
    test('creates PaymentRequestModel with valid data', () {
      final paymentRequest = MxPaymentRequestModel(
        amount: 10.99,
        tenderType: .card,
        paymentType: .sale,
        cardAccount: MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: '2025', cvv: '123'),
        customerName: 'Huy Panha',
        customerCode: 'CUST001',
        source: .api,
      );

      expect(paymentRequest.amount, equals(10.99));
      expect(paymentRequest.customerName, equals('Huy Panha'));
      expect(paymentRequest.customerCode, equals('CUST001'));
    });

    test('serializes PaymentRequestModel to JSON correctly', () {
      final paymentRequest = MxPaymentRequestModel(
        amount: 10.99,
        tenderType: .card,
        paymentType: .sale,
        cardAccount: MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: '2025', cvv: '123'),
        customerName: 'Huy Panha',
        customerCode: 'CUST001',
        source: .api,
      );

      final json = paymentRequest.toBodyJson();

      expect(json['amount'], equals(10.99));
      expect(json['tenderType'], equals('Card'));
      expect(json['paymentType'], equals('Sale'));
      expect(json['customerName'], equals('Huy Panha'));
      expect(json['customerCode'], equals('CUST001'));
      expect(json['source'], equals('API'));
      expect(json['cardAccount'], isNotNull);
    });

    test('creates CardModel with valid data', () {
      final card = MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: '2025', cvv: '123');

      expect(card.number, equals('4242424242424242'));
      expect(card.expiryMonth, equals('12'));
      expect(card.expiryYear, equals('2025'));
      expect(card.cvv, equals('123'));
    });

    test('serializes CardModel to JSON correctly', () {
      final card = MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: '2025', cvv: '123');

      final json = card.toJson();

      expect(json['number'], equals('4242424242424242'));
      expect(json['expiryMonth'], equals('12'));
      expect(json['expiryYear'], equals('2025'));
      expect(json['cvv'], equals('123'));
    });

    test('creates BankAccountModel with valid data', () {
      final bankAccount = MxBankAccountModel(accountNumber: '123456789', routingNumber: '021000021', type: .checking, name: 'Huy Panha');

      expect(bankAccount.accountNumber, equals('123456789'));
      expect(bankAccount.routingNumber, equals('021000021'));
      expect(bankAccount.name, equals('Huy Panha'));
    });

    test('serializes BankAccountModel to JSON correctly', () {
      final bankAccount = MxBankAccountModel(accountNumber: '123456789', routingNumber: '021000021', type: .checking, name: 'Huy Panha');

      final json = bankAccount.toJson();

      expect(json['accountNumber'], equals('123456789'));
      expect(json['routingNumber'], equals('021000021'));
      expect(json['type'], equals('Checking'));
      expect(json['name'], equals('Huy Panha'));
    });
  });

  group('Terminal Service Models', () {
    test('creates TerminalRequestModel with minimal data', () {
      final terminalRequest = MxTerminalRequestModel(providerKey: 'dejavoo');

      expect(terminalRequest.providerKey, equals('dejavoo'));
      expect(terminalRequest.enabled, isFalse);
      expect(terminalRequest.name, isNull);
      expect(terminalRequest.description, isNull);
    });

    test('creates TerminalRequestModel with full data', () {
      final terminalRequest = MxTerminalRequestModel(
        providerKey: 'dejavoo',
        enabled: true,
        name: 'Main Terminal',
        description: 'Primary payment terminal',
        tip: MxTerminalTipModel(
          allow: true,
          allowCustom: true,
          options: [MxTerminalTipOptionModel(rate: MxTerminalTipRateModel(value: 15, isPercentage: true))],
        ),
        entryModes: MxTerminalEntryModeModel(swipe: true, insert: true, tap: true, pinPad: true),
        paymentMethods: MxTerminalPaymentMethodModel(credit: true, debit: true),
      );

      expect(terminalRequest.providerKey, equals('dejavoo'));
      expect(terminalRequest.enabled, isTrue);
      expect(terminalRequest.name, equals('Main Terminal'));
      expect(terminalRequest.description, equals('Primary payment terminal'));
      expect(terminalRequest.tip, isNotNull);
      expect(terminalRequest.entryModes, isNotNull);
      expect(terminalRequest.paymentMethods, isNotNull);
    });

    test('serializes TerminalRequestModel to JSON correctly', () {
      final terminalRequest = MxTerminalRequestModel(
        providerKey: 'dejavoo',
        enabled: true,
        name: 'Main Terminal',
        description: 'Primary payment terminal',
      );

      final json = terminalRequest.toJson();

      expect(json['enabled'], isTrue);
      expect(json['name'], equals('Main Terminal'));
      expect(json['description'], equals('Primary payment terminal'));
    });
  });

  group('Terminal Transaction Service Models', () {
    test('creates CreateTransactionRequestModel with minimal data', () {
      final request = MxTerminalCreateTransactionRequestModel(terminalId: 'terminal_123');

      expect(request.terminalId, equals('terminal_123'));
      expect(request.amount, equals(0.01));
      expect(request.type, equals(MxPaymentTransactionTypeEnum.sale));
      expect(request.vaultCard, isFalse);
      expect(request.replayId, isNull);
    });

    test('creates CreateTransactionRequestModel with full data', () {
      final request = MxTerminalCreateTransactionRequestModel(
        terminalId: 'terminal_123',
        amount: 25.50,
        type: MxPaymentTransactionTypeEnum.sale,
        vaultCard: true,
        replayId: '123456789012345',
      );

      expect(request.terminalId, equals('terminal_123'));
      expect(request.amount, equals(25.50));
      expect(request.type, equals(MxPaymentTransactionTypeEnum.sale));
      expect(request.vaultCard, isTrue);
      expect(request.replayId, equals('123456789012345'));
    });

    test('validates replay ID format', () {
      expect(() => MxTerminalCreateTransactionRequestModel(terminalId: 'terminal_123', replayId: 'invalid'), throwsA(isA<AssertionError>()));

      expect(
        () => MxTerminalCreateTransactionRequestModel(
          terminalId: 'terminal_123',
          replayId: '12345678901234', // 14 digits
        ),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => MxTerminalCreateTransactionRequestModel(
          terminalId: 'terminal_123',
          replayId: '1234567890123456', // 16 digits
        ),
        throwsA(isA<AssertionError>()),
      );

      // Should not throw with valid 15-digit replay ID
      expect(() => MxTerminalCreateTransactionRequestModel(terminalId: 'terminal_123', replayId: '123456789012345'), returnsNormally);
    });

    test('serializes CreateTransactionRequestModel to JSON correctly', () {
      final request = MxTerminalCreateTransactionRequestModel(
        terminalId: 'terminal_123',
        amount: 25.50,
        type: MxPaymentTransactionTypeEnum.sale,
        vaultCard: true,
        replayId: '123456789012345',
      );

      final json = request.toJson();

      expect(json['amount'], equals(25.50));
      expect(json['type'], equals('Sale'));
      expect(json['vaultCard'], isTrue);
      expect(json['replayId'], equals('123456789012345'));
    });

    test('creates UpdateTransactionRequestModel with required data', () {
      final request = MxTerminalUpdateTransactionRequestModel(reference: 'ref_12345', terminalId: 'terminal_123', transactionId: 'txn_67890');

      expect(request.reference, equals('ref_12345'));
      expect(request.terminalId, equals('terminal_123'));
      expect(request.transactionId, equals('txn_67890'));
    });

    test('serializes UpdateTransactionRequestModel to JSON correctly', () {
      final request = MxTerminalUpdateTransactionRequestModel(reference: 'ref_12345', terminalId: 'terminal_123', transactionId: 'txn_67890');

      final json = request.toJson();

      expect(json['reference'], equals('ref_12345'));
      expect(json['terminalId'], equals('terminal_123'));
      expect(json['transactionId'], equals('txn_67890'));
    });
  });

  group('Enums', () {
    test('MxEnvironment enum values', () {
      expect(MxMerchantEnvironmentEnum.sandbox.name, equals('sandbox'));
      expect(MxMerchantEnvironmentEnum.production.name, equals('production'));
    });

    test('MxTenderType enum values', () {
      expect(MxPaymentTenderTypeEnum.card.name, equals('Card'));
      expect(MxPaymentTenderTypeEnum.ach.name, equals('ACH'));
      expect(MxPaymentTenderTypeEnum.check.name, equals('Check'));
    });
  });

  group('Model Validation', () {
    test('PaymentRequestModel validates required fields', () {
      expect(
        () => MxPaymentRequestModel(
          amount: -1.0, // Negative amount should be invalid
          tenderType: .card,
          paymentType: .sale,
          source: .api,
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('JSON Serialization Edge Cases', () {
    test('handles null values in JSON serialization', () {
      final paymentRequest = MxPaymentRequestModel(
        amount: 10.99,
        tenderType: .any,
        paymentType: .sale,
        source: .api,
        // Optional fields are null
      );

      final json = paymentRequest.toBodyJson();

      expect(json['amount'], equals(10.99));
      expect(json['tenderType'], equals('Any'));
      expect(json['paymentType'], equals('Sale'));
      expect(json['source'], equals('API'));
      // Null fields should be excluded from JSON
      expect(json.containsKey('cardAccount'), isFalse);
      expect(json.containsKey('bankAccount'), isFalse);
    });

    test('removes null values from TerminalRequestModel JSON', () {
      final terminalRequest = MxTerminalRequestModel(
        providerKey: 'dejavoo',
        // Optional fields are null
      );

      final json = terminalRequest.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('description'), isFalse);
      expect(json.containsKey('tip'), isFalse);
    });
  });

  group('Error Handling', () {
    test('MxMerchantException can be created with message and code', () {
      final exception = MxMerchantException(message: 'Test error message', statusCode: 400);

      expect(exception.message, equals('Test error message'));
      expect(exception.statusCode, equals(400));
    });

    test('MxMerchantException toString returns formatted message', () {
      final exception = MxMerchantException(message: 'Test error message', statusCode: 400);

      expect(exception.toString(), equals('MxMerchantException(400): Test error message'));
    });
  });

  group('Integration Tests', () {
    test('complete payment flow models work together', () {
      final paymentRequest = MxPaymentRequestModel(
        amount: 100.0,
        tenderType: MxPaymentTenderTypeEnum.card,
        paymentType: .sale,
        cardAccount: MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: '2025', cvv: '123'),
        customerName: 'Test Customer',
        customerCode: 'TEST001',
        source: .api,
      );

      final json = paymentRequest.toBodyJson();
      final reconstructed = MxPaymentRequestModel.fromJson(json);

      expect(reconstructed.amount, equals(paymentRequest.amount));
      expect(reconstructed.tenderType, equals(paymentRequest.tenderType));
      expect(reconstructed.paymentType, equals(paymentRequest.paymentType));
      expect(reconstructed.customerName, equals(paymentRequest.customerName));
      expect(reconstructed.customerCode, equals(paymentRequest.customerCode));
      expect(reconstructed.source, equals(paymentRequest.source));
    });

    test('terminal transaction flow models work together', () {
      final createRequest = MxTerminalCreateTransactionRequestModel(
        terminalId: 'terminal_123',
        amount: 50.0,
        type: MxPaymentTransactionTypeEnum.sale,
        vaultCard: false,
        replayId: '123456789012345',
      );

      final updateRequest = MxTerminalUpdateTransactionRequestModel(reference: 'ref_12345', terminalId: 'terminal_123', transactionId: 'txn_67890');

      expect(createRequest.terminalId, equals(updateRequest.terminalId));
      expect(createRequest.toJson().containsKey('replayId'), isTrue);
      expect(updateRequest.toJson().containsKey('reference'), isTrue);
    });
  });
}
