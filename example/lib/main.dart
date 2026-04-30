import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mx_merchant/mx_merchant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MX Merchant Example', home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MxMerchant merchant;
  final _consumerKeyController = TextEditingController();
  final _consumerSecretController = TextEditingController();
  final _merchantIdController = TextEditingController();

  Future testPayment() async {
    merchant = MxMerchant(
      consumerKey: _consumerKeyController.text.trim(),
      consumerSecret: _consumerSecretController.text.trim(),
      merchantId: _merchantIdController.text.trim(),
      env: .sandbox,
    );

    final paymentResult = await merchant.payment.makePayment(
      MxPaymentRequestModel(
        amount: 1,
        tenderType: .card,
        paymentType: .sale,
        cardAccount: MxCardModel(number: '4242424242424242', expiryMonth: '12', expiryYear: (DateTime.now().year + 1).toString(), cvv: '123'),
        customerName: 'Panha Huy',
        customerCode: 'KH00000001',
        replayId: 1,
        source: .api,
      ),
    );
    log('paymentResult = ${paymentResult.toJson()}');

    final getPaymentsResult = await merchant.payment.getPayments(MxGetPaymentRequestModel());
    log('getPaymentsResult = ${getPaymentsResult.toJson()}');

    final getAPaymentsResult = await merchant.payment.getAPayment(paymentResult.id.toString(), includeCustomer: true);
    log('getAPaymentsResult = ${getAPaymentsResult.toJson()}');

    final voidQResult = await merchant.payment.voidAPayment(paymentResult.id.toString(), force: true);
    log('voidQResult = $voidQResult');

    final sendPaymentReceiptResult = await merchant.payment.sendAPaymentReceipt(paymentId: paymentResult.id.toString(), contact: 'your@mail.com');
    log('sendPaymentReceiptResult = $sendPaymentReceiptResult');

    final terminalResult = await merchant.terminal.getListOfTerminals();
    log('terminalResult = ${terminalResult.map((e) => e.toJson())}');

    final createTerminalResult = await merchant.terminal.createTerminal(MxTerminalRequestModel(providerKey: 'dejavoo'));
    log('createTerminalResult = $createTerminalResult');

    final deleteTerminalResult = await merchant.terminal.deleteTerminal('terminalId');
    log('deleteTerminalResult = $deleteTerminalResult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, surfaceTintColor: Colors.white, title: Text('MX Merchant Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Consumer Key'),
            TextFormField(controller: _consumerKeyController),
            Text('Consumer Secret'),
            TextFormField(controller: _consumerSecretController),
            Text('Merchant ID'),
            TextFormField(controller: _merchantIdController),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: testPayment, child: Text('Test Make Payment')),
          ],
        ),
      ),
    );
  }
}
