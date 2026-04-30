# MX Merchant

A comprehensive Flutter/Dart client package for integrating with the MX Merchant REST APIs. This package provides a clean, type-safe interface for processing payments, managing customers, handling vaulted accounts, generating reports, and more.

## Features

- 💳 **Payment Processing**: Process credit card, ACH, and check payments
- 🔒 **Enhanced Authentication**: Support for both Basic and JWT authentication methods
- 🖥️ **Terminal Management**: Create, list, and manage payment terminal devices
- 👥 **Customer Management**: Create and manage customer profiles
- 🏦 **Vaulted Accounts**: Store and manage payment methods securely
- 📊 **Reporting**: Access transaction reports and analytics
- 🌐 **Multi-API Support**: Support for both v1 and v2 MX Merchant APIs
- 📱 **Cross-Platform**: Works on Android, iOS, macOS, Windows, Linux, and Web
- 🎯 **Type Safety**: Full Dart type safety with comprehensive models
- 📧 **Receipt Management**: Send payment receipts via email or SMS

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  mx_merchant: ^0.0.1-beta.3
```

Then run:

```bash
flutter pub get
```

## Getting Started

### Prerequisites

1. **MX Merchant Account**: You need an active MX Merchant account with API access
2. **API Credentials**: Obtain your Consumer Key, Consumer Secret, and Merchant ID from the MX Merchant dashboard
3. **Environment**: Choose between sandbox (for testing) and production environments

### Initialization

```dart
import 'package:mx_merchant/mx_merchant.dart';

// Initialize MX Merchant client
final merchant = MxMerchant(
  consumerKey: 'your_consumer_key',
  consumerSecret: 'your_consumer_secret', 
  merchantId: 'your_merchant_id',
  env: .sandbox, // or .production
);
```

## Usage

### Making a Payment

```dart
// Process a credit card payment
final paymentResult = await merchant.payment.makePayment(
  MxPaymentRequestModel(
    amount: 10.99,
    tenderType: .card,
    paymentType: .sale,
    cardAccount: MxCardModel(
      number: '4242424242424242',
      expiryMonth: '12',
      expiryYear: '2025',
      cvv: '123',
    ),
    customerName: 'John Doe',
    customerCode: 'CUST001',
    source: .api,
  ),
);

print('Payment ID: ${paymentResult.id}');
print('Status: ${paymentResult.status}');
```

### Retrieving Payments

```dart
// Get multiple payments with filters
final payments = await merchant.payment.getPayments(
  MxGetPaymentRequestModel(
    status: .approved,
    dateType: .today,
  ),
);

// Get a specific payment
final payment = await merchant.payment.getAPayment(
  paymentResult.id.toString(),
  includeCustomer: true,
);
```

### Voiding a Payment

```dart
// Void a payment
final voidResult = await merchant.payment.voidAPayment(
  paymentResult.id.toString(),
  force: true, // Force refund if already settled
);
```

### Sending Receipts

```dart
// Send payment receipt via email
final receiptResult = await merchant.payment.sendAPaymentReceipt(
  paymentId: paymentResult.id.toString(),
  contact: 'customer@example.com',
);
```

### ACH Payment Example

```dart
// Process an ACH payment
final achPayment = await merchant.payment.makePayment(
  MxPaymentRequestModel(
    amount: 25.00,
    tenderType: .ach,
    paymentType: .sale,
    bankAccount: MxBankAccountModel(
      accountNumber: '123456789',
      routingNumber: '021000021',
      accountType: .checking,
      nameOnAccount: 'John Doe',
    ),
    entryClass: .web,
    customerName: 'John Doe',
    source: .api,
  ),
);
```

### Terminal Management

```dart
// Get list of terminals
final terminals = await merchant.terminal.getListOfTerminals();
print('Available terminals: ${terminals.length}');

// Create a new terminal
final newTerminal = await merchant.terminal.createTerminal(
  MxTerminalRequestModel(
    providerKey: 'dejavoo',
    enabled: true,
    name: 'Main Terminal',
    description: 'Primary payment terminal',
    tip: MxTerminalTipModel(
      allow: true,
      allowCustom: true,
      options: [
        MxTerminalTipOptionModel(
          rate: MxTerminalTipRateModel(value: 15, isPercentage: true),
        ),
      ],
    ),
    entryModes: MxTerminalEntryModeModel(
      swipe: true,
      insert: true,
      tap: true,
      pinPad: true,
    ),
    paymentMethods: MxTerminalPaymentMethodModel(
      credit: true,
      debit: true,
    ),
  ),
);

// Delete a terminal
final deleted = await merchant.terminal.deleteTerminal('terminal_id_here');
print('Terminal deleted: $deleted');
```

## API Reference

### Payment Service Methods

- `makePayment()` - Process a new payment transaction
- `getPayments()` - Retrieve multiple payments with filtering options
- `getAPayment()` - Retrieve a specific payment by ID
- `voidAPayment()` - Void or refund a payment
- `sendAPaymentReceipt()` - Send payment receipt via email or SMS

### Terminal Service Methods

- `getListOfTerminals()` - Retrieve all terminals for the merchant
- `createTerminal()` - Create a new payment terminal
- `deleteTerminal()` - Delete an existing terminal

### Supported Payment Types

- **Credit/Debit Cards**: Visa, Mastercard, American Express, Discover
- **ACH Payments**: Direct bank transfers
- **Check Payments**: Electronic check processing

### Authentication Methods

- **Basic Authentication**: Used for payment processing (v1 API)
- **JWT Authentication**: Used for terminal management (v2 API)

### API Versions

- **v1 API**: Primary checkout and payment processing
- **v2 API**: Terminal management and advanced features

### Environment Configuration

- **Sandbox**: For testing and development (default)
- **Production**: For live transactions

## Error Handling

The package provides comprehensive error handling with custom exceptions:

```dart
try {
  final result = await merchant.payment.makePayment(paymentRequest);
} on MxMerchantException catch (e) {
  print('MX Merchant Error: ${e.message}');
  print('Error Code: ${e.code}');
} catch (e) {
  print('Unexpected Error: $e');
}
```

## Example App

For a complete working example, see the `/example` directory in this package. The example demonstrates:

- Client initialization
- Payment processing with different tender types
- Terminal management operations
- Error handling
- Receipt sending
- Multiple authentication methods

Run the example with:

```bash
cd example
flutter run
```

## Additional Information

### Documentation

- **MX Merchant API Documentation**: [https://developer.mxmerchant.com/reference/introduction](https://developer.mxmerchant.com/reference/introduction)
- **Package Repository**: [https://github.com/huypanha/mx_merchant](https://github.com/huypanha/mx_merchant)

### Support

- **Issue Tracker**: [https://github.com/huypanha/mx_merchant/issues](https://github.com/huypanha/mx_merchant/issues)
- **MX Merchant Developer Portal**: [https://developer.mxmerchant.com/](https://developer.mxmerchant.com/)

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Security

- Never expose your API credentials in client-side code
- Always use environment variables or secure storage for sensitive data
- Use sandbox environment for testing and development
- Implement proper error handling and logging
- JWT tokens are automatically managed for v2 API calls
- Basic authentication is used for v1 payment operations

### Topics

- payments
- mxmerchant  
- checkout
- rest
- gateway
- terminal
- flutter
- dart

### Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history and updates.

---

**Note**: This package is not officially affiliated with MX Merchant. Please refer to the official MX Merchant documentation for the most up-to-date API information.
