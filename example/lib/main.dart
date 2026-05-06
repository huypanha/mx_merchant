import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mx_merchant/mx_merchant.dart';

void main() {
  runApp(const MXMerchantExampleApp());
}

class MXMerchantExampleApp extends StatelessWidget {
  const MXMerchantExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MX Merchant Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1), brightness: Brightness.light),
        useMaterial3: true,
        cardTheme: Theme.of(context).cardTheme.copyWith(elevation: 2, shape: RoundedRectangleBorder(borderRadius: .circular(12))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const .symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: .circular(8)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: .circular(8)),
          contentPadding: const .symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      home: const MXMerchantHomePage(),
    );
  }
}

class MXMerchantHomePage extends StatefulWidget {
  const MXMerchantHomePage({super.key});

  @override
  State<MXMerchantHomePage> createState() => _MXMerchantHomePageState();
}

class _MXMerchantHomePageState extends State<MXMerchantHomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  final _consumerKeyController = TextEditingController(text: '');
  final _consumerSecretController = TextEditingController(text: '');
  final _merchantIdController = TextEditingController(text: '');

  bool _isLoading = false;
  String _lastResult = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _consumerKeyController.dispose();
    _consumerSecretController.dispose();
    _merchantIdController.dispose();
    super.dispose();
  }

  MxMerchant _createMerchant() {
    return MxMerchant(
      consumerKey: _consumerKeyController.text.trim(),
      consumerSecret: _consumerSecretController.text.trim(),
      merchantId: _merchantIdController.text.trim(),
      env: .sandbox,
    );
  }

  void _setLoading(bool loading) {
    setState(() {
      _isLoading = loading;
      _errorMessage = null;
    });
  }

  void _setResult(String result) {
    setState(() {
      _lastResult = result;
    });
  }

  void _setError(String error) {
    setState(() {
      _errorMessage = error;
      _isLoading = false;
    });
  }

  Future<void> _testPaymentFlow() async {
    if (!_validateCredentials()) return;

    _setLoading(true);
    try {
      final merchant = _createMerchant();
      final results = <String, dynamic>{};

      // Make Payment
      final paymentResult = await merchant.payment.makePayment(
        MxPaymentRequestModel(
          amount: 13.00,
          tenderType: .card,
          paymentType: .sale,
          cardAccount: MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: (DateTime.now().year + 1).toString(), cvv: '123'),
          customerName: 'Test Customer',
          customerCode: 'TEST001',
          replayId: 13,
          source: .api,
        ),
      );
      results['payment'] = paymentResult.toJson();
      log("payment = ${results['payment']}");

      // Get Payments
      final getPaymentsResult = await merchant.payment.getPayments(MxGetPaymentRequestModel(limit: 2));
      results['getPayments'] = getPaymentsResult.toJson();
      log("getPayments = ${results['getPayments']}");

      // Get Specific Payment
      final getAPaymentResult = await merchant.payment.getAPayment(paymentResult.id.toString(), includeCustomer: true);
      results['getAPayment'] = getAPaymentResult.toJson();
      log("getAPayment = ${results['getAPayment']}");

      // Void Payment
      final voidResult = await merchant.payment.voidAPayment(paymentResult.id.toString(), force: true);
      results['voidPayment'] = voidResult;
      log("voidPayment = ${results['voidPayment']}");

      // Send Receipt
      final receiptResult = await merchant.payment.sendAPaymentReceipt(paymentId: paymentResult.id.toString(), contact: 'huypanha558@gmail.com');
      results['sendReceipt'] = receiptResult;
      log("sendReceipt = ${results['sendReceipt']}");

      log(jsonEncode(results));
      _setResult(jsonEncode(results));
    } catch (e, s) {
      log("Payment flow failed: $e", stackTrace: s);
      _setError('Payment flow failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _testTerminalFlow() async {
    if (!_validateCredentials()) return;

    _setLoading(true);
    try {
      final merchant = _createMerchant();
      final results = <String, dynamic>{};

      // Create Terminal
      final createResult = await merchant.terminal.create(
        MxTerminalRequestModel(
          providerKey: 'anywherecommerce',
          enabled: true,
          name: 'Test Terminal',
          description: 'Test terminal for demonstration',
          defaultModel: 'Sherpa',
          tip: MxTerminalTipModel(options: [MxTerminalTipOptionModel(rate: MxTerminalTipRateModel())]),
          entryModes: MxTerminalEntryModeModel(),
          paymentMethods: MxTerminalPaymentMethodModel(),
        ),
      );
      results['createTerminal'] = createResult.toJson();

      // Get Terminals
      final terminalsResult = await merchant.terminal.getListOfTerminals();
      results['getTerminals'] = terminalsResult.map((e) => e.toJson()).toList();

      // Delete Terminals
      final deleteTerminalResult = await merchant.terminal.delete(terminalsResult.first.id.toString());
      results['deleteTerminalResult'] = deleteTerminalResult;

      log(jsonEncode(results));
      _setResult(jsonEncode(results));
    } catch (e, s) {
      log("Terminal flow failed: $e", stackTrace: s);
      _setError('Terminal flow failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _testCustomersFlow() async {
    if (!_validateCredentials()) return;

    _setLoading(true);
    try {
      final merchant = _createMerchant();
      final results = <String, dynamic>{};

      // Create Customer
      final createResult = await merchant.customer.create(
        MxCreateCustomerRequestModel(
          firstName: 'Huy',
          lastName: 'Panha',
          email: 'email@example.com',
          phone: '+1234567890',
          name: 'Huy Panha',
          activeStatus: true,
        ),
      );
      results['createCustomer'] = createResult.toJson();

      // Get Customers
      final getResults = await merchant.customer.get(MxGetCustomerRequestModel(limit: 10));
      results['getCustomers'] = getResults.records?.map((e) => e.toJson()).toList();

      // Get Specific Customer
      final getCustomerResult = await merchant.customer.getACustomer(createResult.id);
      results['getCustomer'] = getCustomerResult.toJson();

      // Update Customer
      final updateCustomerResult = await merchant.customer.update(
        customerData: createResult.copyWith(name: 'Huy Panha Updated').toRequestModel(),
        customerId: createResult.id,
      );
      results['updateCustomerResult'] = updateCustomerResult;

      // Create a customer address
      final createAddress = await merchant.customer.createAddress(
        MxCreateCustomerAddressRequestModel(
          customerId: createResult.id,
          address1: createResult.address1,
          address2: createResult.address2,
          city: createResult.city,
          state: createResult.state,
          zip: createResult.zip,
        ),
      );
      results['createAddress'] = createAddress.toJson();

      // Get customer addresses
      final getAddresses = await merchant.customer.getAddress(createResult.id);
      results['getAddresses'] = getAddresses.map((e) => e.toJson()).toList();

      // Update customer addresses
      final updateAddresses = await merchant.customer.updateAddress(createAddress.toRequestModel().copyWith(customerId: createResult.id));
      results['updateAddresses'] = updateAddresses;

      // Add Note to Customer
      final noteAdded = await merchant.customer.addNote(customerId: createResult.id, note: 'Test customer created via API');
      results['addNote'] = noteAdded;

      // Get Customer Notes
      final notes = await merchant.customer.getNote(createResult.id);
      results['getNotes'] = notes.map((e) => e.toJson()).toList();

      // Get Customer Payments
      final payments = await merchant.customer.getPayments(customerId: createResult.id, offset: 0, limit: 10);
      results['getCustomerPayments'] = payments.toJson();

      _setResult(jsonEncode(results));
    } catch (e, s) {
      log("Customer flow failed: $e", stackTrace: s);
      _setError('Customer flow failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _testTerminalTransactionFlow() async {
    if (!_validateCredentials()) return;

    _setLoading(true);
    try {
      final merchant = _createMerchant();
      final results = <String, dynamic>{};

      // Create Terminal Transaction
      final createResult = await merchant.terminal.transaction.create(
        MxTerminalCreateTransactionRequestModel(
          terminalId: '6EAB751C-2235-4FC6-AD18-625A088399D8',
          amount: 10.00,
          type: .sale,
          vaultCard: false,
          replayId: '000000000000001',
        ),
      );
      results['createTransaction'] = createResult.toJson();

      // Get Transaction
      final getResult = await merchant.terminal.transaction.get('000000000000001');
      results['getTransaction'] = getResult.toJson();

      // Update Transaction (example with empty data)
      try {
        await merchant.terminal.transaction.update(
          MxTerminalUpdateTransactionRequestModel(
            reference: 'test_ref',
            terminalId: '6EAB751C-2235-4FC6-AD18-625A088399D8',
            transactionId: 'test_txn_id',
          ),
        );
        results['updateTransaction'] = 'Success';
      } catch (e) {
        results['updateTransaction'] = 'Expected error: $e';
      }

      // Delete Queued Transaction
      try {
        final deleteResult = await merchant.terminal.transaction.deleteQueued('6EAB751C-2235-4FC6-AD18-625A088399D8');
        results['deleteTransaction'] = deleteResult;
      } catch (e) {
        results['deleteTransaction'] = 'Expected error: $e';
      }

      log(jsonEncode(results));
      _setResult(jsonEncode(results));
    } catch (e, s) {
      log("Terminal transaction flow failed: $e", stackTrace: s);
      _setError('Terminal transaction flow failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _testCustomFieldsFlow() async {
    if (!_validateCredentials()) return;

    _setLoading(true);
    try {
      final merchant = _createMerchant();
      final results = <String, dynamic>{};

      // Create Custom Field
      final createResult = await merchant.customer.customField.create(
        MxCreateCustomFieldRequestModel(
          name: 'Customer Rating',
          fieldName: 'customer_rating',
          fieldDataType: .decimal,
          isRequired: false,
          echo: true,
        ),
      );
      results['createCustomField'] = createResult.toJson();

      // Get Custom Fields for a customer
      try {
        final getResults = await merchant.customer.customField.get('test_customer_id');
        results['getCustomFields'] = getResults.map((e) => e.toJson()).toList();
      } catch (e) {
        results['getCustomFields'] = 'Expected error: $e';
      }

      // Delete Custom Field (example)
      try {
        final fieldId = createResult.id;
        final deleteResult = await merchant.customer.customField.delete(fieldId);
        results['deleteCustomField'] = deleteResult;
      } catch (e) {
        results['deleteCustomField'] = 'Expected error: $e';
      }

      log(jsonEncode(results));
      _setResult(jsonEncode(results));
    } catch (e, s) {
      log("Custom fields flow failed: $e", stackTrace: s);
      _setError('Custom fields flow failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  bool _validateCredentials() {
    if (_consumerKeyController.text.trim().isEmpty || _consumerSecretController.text.trim().isEmpty || _merchantIdController.text.trim().isEmpty) {
      _setError('Please fill in all credential fields');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MX Merchant Example'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: .start,
          tabs: const [
            Tab(icon: Icon(Icons.payment), text: 'Payments'),
            Tab(icon: Icon(Icons.people), text: 'Customers'),
            Tab(icon: Icon(Icons.devices), text: 'Terminals'),
            Tab(icon: Icon(Icons.sync_alt), text: 'Transactions'),
            Tab(icon: Icon(Icons.person_outline), text: 'Custom Fields'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildPaymentsTab(), _buildCustomersTab(), _buildTerminalsTab(), _buildTransactionsTab(), _buildCustomFieldsTab()],
      ),
    );
  }

  Widget _buildCredentialsCard() {
    return Card(
      margin: const .all(16),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('API Credentials', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _consumerKeyController,
              decoration: const InputDecoration(labelText: 'Consumer Key', hintText: 'Enter your consumer key'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _consumerSecretController,
              decoration: const InputDecoration(labelText: 'Consumer Secret', hintText: 'Enter your consumer secret'),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _merchantIdController,
              decoration: const InputDecoration(labelText: 'Merchant ID', hintText: 'Enter your merchant ID'),
            ),
            const SizedBox(height: 8),
            Text('Using Sandbox Environment', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCredentialsCard(),
          Card(
            margin: const .all(16),
            child: Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Payment Operations', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Test the complete payment flow including creating payments, retrieving payment data, voiding transactions, and sending receipts.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testPaymentFlow,
                      icon: _isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.play_arrow),
                      label: Text(_isLoading ? 'Processing...' : 'Test Payment Flow'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null) _buildErrorCard(),
          if (_lastResult.isNotEmpty) _buildResultCard(),
        ],
      ),
    );
  }

  Widget _buildCustomersTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCredentialsCard(),
          Card(
            margin: const .all(16),
            child: Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Customer Operations', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Test customer management operations including creating customers, retrieving customer data, adding notes, and getting payment history.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testCustomersFlow,
                      icon: _isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.people),
                      label: Text(_isLoading ? 'Processing...' : 'Test Customer Flow'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null) _buildErrorCard(),
          if (_lastResult.isNotEmpty) _buildResultCard(),
        ],
      ),
    );
  }

  Widget _buildTerminalsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCredentialsCard(),
          Card(
            margin: const .all(16),
            child: Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Terminal Operations', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Test terminal management operations including listing terminals and creating new terminals.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testTerminalFlow,
                      icon: _isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.devices),
                      label: Text(_isLoading ? 'Processing...' : 'Test Terminal Flow'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null) _buildErrorCard(),
          if (_lastResult.isNotEmpty) _buildResultCard(),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCredentialsCard(),
          Card(
            margin: const .all(16),
            child: Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Terminal Transaction Operations', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Test terminal transaction operations including creating, updating, retrieving, and deleting terminal transactions.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testTerminalTransactionFlow,
                      icon: _isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.sync_alt),
                      label: Text(_isLoading ? 'Processing...' : 'Test Transaction Flow'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null) _buildErrorCard(),
          if (_lastResult.isNotEmpty) _buildResultCard(),
        ],
      ),
    );
  }

  Widget _buildCustomFieldsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCredentialsCard(),
          Card(
            margin: const .all(16),
            child: Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Customer Custom Field Operations', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Test customer custom field operations including creating, retrieving, and deleting custom fields for customers.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _testCustomFieldsFlow,
                      icon: _isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.person_outline),
                      label: Text(_isLoading ? 'Processing...' : 'Test Custom Fields Flow'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorMessage != null) _buildErrorCard(),
          if (_lastResult.isNotEmpty) _buildResultCard(),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    return Card(
      margin: const .all(16),
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const .all(16),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 12),
            Expanded(
              child: Text(_errorMessage!, style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
            ),
            IconButton(
              onPressed: () => setState(() => _errorMessage = null),
              icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onErrorContainer),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      margin: const .all(16),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              spacing: 5,
              children: [
                Expanded(
                  child: Text('API Response', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                ),
                IconButton(
                  onPressed: () async => await Clipboard.setData(ClipboardData(text: _lastResult)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
                  }),
                  icon: const Icon(Icons.copy),
                ),
                IconButton(onPressed: () => setState(() => _lastResult = ''), icon: const Icon(Icons.clear)),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const .all(12),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: .circular(8)),
              child: SingleChildScrollView(
                child: SelectableText(_lastResult, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'), maxLines: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
