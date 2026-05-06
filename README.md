# MX Merchant

<img src="assets/images/mx_logo.png" alt="Logo" width="100%" />

A comprehensive Flutter/Dart client package for integrating with the MX Merchant REST APIs. This package provides a clean, type-safe interface for processing payments, managing customers, handling vaulted accounts, generating reports, and more.

## Features

- 💳 **Payment Processing**: Process credit card, ACH, and check payments
- 🖥️ **Terminal Management**: Create, list, and manage payment terminal devices
- 🔄 **Terminal Transactions**: Create, update, retrieve, and delete terminal transactions
- 👥 **Customer Custom Fields**: Create, retrieve, and manage custom fields for customers
- 📱 **Cross-Platform**: Works on Android, iOS, macOS, Windows, Linux, and Web
- 🎯 **Type Safety**: Full Dart type safety with comprehensive models
- 📧 **Receipt Management**: Send payment receipts via email or SMS

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  mx_merchant: <latest version>
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
    amount: 99.99,
    tenderType: .card,
    paymentType: .sale,
    cardAccount: MxCardModel(
      number: '4242424242424242',
      expiryMonth: '12',
      expiryYear: (DateTime.now().year + 1).toString(),
      cvv: '123',
      avsZip: '12345',
      avsStreet: 'Cambodia',
    ),
    customerName: 'Test Customer',
    customerCode: 'TEST001',
    replayId: 99,
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
    limit: 10,
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
      nameOnAccount: 'Huy Panha',
    ),
    entryClass: .web,
    customerName: 'Huy Panha',
    source: .api,
  ),
);
```

### Customer Management

```dart
// Create a new customer
final customer = await merchant.customer.create(
  MxCreateCustomerRequestModel(
    firstName: 'Huy',
    lastName: 'Panha',
    email: 'email@example.com',
    phone: '+1234567890',
    name: 'Huy Panha',
    activeStatus: true,
  ),
);

print('Customer ID: ${customer.id}');
print('Customer Name: ${customer.firstName} ${customer.lastName}');

// Get multiple customers with filters
final customers = await merchant.customer.get(
  MxGetCustomerRequestModel(limit: 10),
);

print('Found ${customers.records?.length} customers');

// Get a specific customer
final specificCustomer = await merchant.customer.getACustomer(customer.id);
print('Customer Details: ${specificCustomer.firstName} ${specificCustomer.lastName}');

// Update customer information using copyWith
final updateResult = await merchant.customer.update(
  customerData: customer.copyWith(name: 'Huy Panha Updated').toRequestModel(),
  customerId: customer.id,
);

print('Customer updated: $updateResult');

// Create a customer address
final address = await merchant.customer.createAddress(
  MxCreateCustomerAddressRequestModel(
    customerId: customer.id,
    address1: customer.address1,
    address2: customer.address2,
    city: customer.city,
    state: customer.state,
    zip: customer.zip,
  ),
);

print('Address ID: ${address.id}');

// Get customer addresses
final addresses = await merchant.customer.getAddress(customer.id);
print('Customer has ${addresses.length} addresses');

// Update customer address
final addressUpdated = await merchant.customer.updateAddress(
  address.toRequestModel().copyWith(customerId: customer.id),
);

print('Address updated: $addressUpdated');

// Add a note to customer
final noteAdded = await merchant.customer.addNote(
  customerId: customer.id,
  note: 'Test customer created via API',
);

// Get customer notes
final notes = await merchant.customer.getNote(customer.id);
print('Customer has ${notes.length} notes');

// Get customer payments
final payments = await merchant.customer.getPayments(
  customerId: customer.id,
  offset: 0,
  limit: 10,
);

print('Customer payments: ${payments.toJson()}');
```

### Customer Custom Fields

```dart
// Create a new custom field for customers
final customField = await merchant.customer.customField.create(
  MxCreateCustomFieldRequestModel(
    name: 'Customer Rating',
    fieldName: 'customer_rating',
    fieldDataType: .decimal,
    isRequired: false,
    options: [
      MxCustomFieldOptionModel(name: 'Rating', value: '5'),
    ],
  ),
);

print('Custom Field ID: ${customField.id}');
print('Field Name: ${customField.name}');

// Get custom fields for a specific customer
final customerFields = await merchant.customer.customField.get('customer_id_123');
print('Customer has ${customerFields.length} custom fields');

for (final field in customerFields) {
  print('Field: ${field.fieldDefinitionName}');
  print('Type: ${field.fieldDataType}');
  print('Required: ${field.isRequired}');
}

// Delete a custom field
final deleted = await merchant.customer.customField.delete(customField.id);
print('Custom field deleted: $deleted');
```

### Terminal Management

```dart
// Get list of terminals
final terminals = await merchant.terminal.getListOfTerminals();
print('Available terminals: ${terminals.length}');

// Create a new terminal
final newTerminal = await merchant.terminal.create(
  MxTerminalRequestModel(
    providerKey: 'anywherecommerce',
    enabled: true,
    name: 'Test Terminal',
    description: 'Test terminal for demonstration',
    defaultModel: 'Sherpa',
    tip: MxTerminalTipModel(
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

print('Created Terminal ID: ${newTerminal.id}');

// Delete a terminal
final deleted = await merchant.terminal.delete(terminals.first.id.toString());
print('Terminal deleted: $deleted');
```

### Terminal Transactions

> Not fully tested yet because there is no testing equipment.

```dart
// Create a new terminal transaction
final transactionResult = await merchant.terminal.transaction.create(
  MxTerminalCreateTransactionRequestModel(
    terminalId: '6EAB751C-2235-4FC6-AD18-XXXXXXXXXXXX',
    amount: 10.00,
    type: .sale,
    vaultCard: false,
    replayId: '000000000000001',
  ),
);

print('Transaction Status: ${transactionResult.status}');
print('Transaction Message: ${transactionResult.message}');

// Get transaction details by replay ID
final transactionDetails = await merchant.terminal.transaction.get('000000000000001');

// Update an existing terminal transaction
await merchant.terminal.transaction.update(
  MxTerminalUpdateTransactionRequestModel(
    reference: 'test_ref',
    terminalId: '6EAB751C-2235-4FC6-AD18-XXXXXXXXXXXX',
    transactionId: 'test_txn_id',
  ),
);

// Delete a queued terminal transaction
final deleted = await merchant.terminal.transaction.deleteQueued('6EAB751C-2235-4FC6-AD18-XXXXXXXXXXXX');
print('Transaction deleted: $deleted');
```

## API Reference

### Payment Service Methods

- `makePayment()` - Process a new payment transaction
- `getPayments()` - Retrieve multiple payments with filtering options
- `getAPayment()` - Retrieve a specific payment by ID
- `voidAPayment()` - Void or refund a payment
- `sendAPaymentReceipt()` - Send payment receipt via email or SMS

### Customer Service Methods

- `create()` - Create a new customer
- `get()` - Retrieve multiple customers with filtering options
- `getACustomer()` - Retrieve a specific customer by ID
- `update()` - Update customer information
- `addNote()` - Add a note to a customer
- `getNote()` - Retrieve customer notes
- `getPayments()` - Retrieve customer payment history
- `createAddress()` - Create customer address
- `getAddress()` - Retrieve customer addresses
- `updateAddress()` - Update customer address

### Customer Custom Field Service Methods

- `create()` - Create a new custom field for customers
- `get()` - Retrieve custom fields for a specific customer
- `delete()` - Delete a custom field by ID

### Terminal Service Methods

- `getListOfTerminals()` - Retrieve all terminals for the merchant
- `createTerminal()` - Create a new payment terminal
- `deleteTerminal()` - Delete an existing terminal

### Terminal Transaction Service Methods

- `createTransaction()` - Create a new terminal transaction with customizable parameters
- `updateTransaction()` - Update an existing terminal transaction by reference and terminal ID
- `getTransaction()` - Retrieve transaction details using replay ID
- `deleteQueued()` - Delete a queued terminal transaction by terminal ID

### Supported Payment Types

- **Credit/Debit Cards**: Visa, Mastercard, American Express, Discover
- **ACH Payments**: Direct bank transfers
- **Check Payments**: Electronic check processing

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
- Customer management operations (create, retrieve, notes, payment history)
- Customer custom field management
- Terminal management operations
- Terminal transaction operations
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
