enum MxMerchantEnvironment { sandbox, production }

enum MxBankAccountType {
  checking('Checking'),
  savings('Savings');

  final String name;
  const MxBankAccountType(this.name);
}

enum MxCustomerType {
  person('Person'),
  business('Business');

  final String name;
  const MxCustomerType(this.name);
}

enum MxPaymentTransactionType {
  any('Any'),
  sale('Sale'),
  returnTransaction('Return'),
  cashAdvance('CashAdvance'),
  prepaid('Prepaid'),
  adjustment('Adjustment'),
  voidTransaction('Void'),
  reversal('Reversal'),
  authorization('Authorization'),
  saleCompletion('SaleCompletion'),
  paymentTransaction('PaymentTransaction'),
  withdrawal('Withdrawal'),
  Refund('Refund'),
  balance('Balance');

  final String name;
  const MxPaymentTransactionType(this.name);
}

enum MxPaymentTenderType {
  any('Any'),
  card('Card'),
  check('Check'),
  cash('Cash'),
  multiple('Multiple'),
  loyalty('Loyalty'),
  ach('ACH');

  final String name;
  const MxPaymentTenderType(this.name);
}

enum MxPaymentEntryClass {
  ccd('CCD'),
  ppd('PPD'),
  tel('TEL'),
  web('WEB');

  final String name;
  const MxPaymentEntryClass(this.name);
}

enum MxPaymentSource {
  any('Any'),
  api('API'),
  quickPay('QuickPay'),
  recurring('Recurring'),
  link2Pay('Link2Pay'),
  invoice('Invoice'),
  order('Order'),
  mxExpress('mxExpress'),
  mxRetail('mxRetail'),
  bIP('BIP'),
  terminal('Terminal');

  final String name;
  const MxPaymentSource(this.name);
}

enum MxCardHolderPresent {
  unknown('Unknown'),
  present('Present'),
  notPresent('NotPresent'),
  mail('Mail'),
  phone('Phone'),
  standing('Standing'),
  recurring('Recurring'),
  ecom('Ecom');

  final String name;
  const MxCardHolderPresent(this.name);
}

enum MxDevicePresent {
  unknown('Unknown'),
  attended('Attended'),
  homePc('HomePc'),
  voiceAru('VoiceAru'),
  recurring('Recurring'),
  unattended('Unattended');

  final String name;
  const MxDevicePresent(this.name);
}

enum MxDeviceInputCapability {
  unknown('Unknown'),
  voiceAru('VoiceAru'),
  swipe('Swipe'),
  contactlessChip('ContactlessChip'),
  contactlessSwipe('ContactlessSwipe'),
  chipSwipe('ChipSwipe'),
  keyedOnly('KeyedOnly'),
  swipeKeyed('SwipeKeyed'),
  chipSwipeKeyed('ChipSwipeKeyed'),
  chip('Chip');

  final String name;
  const MxDeviceInputCapability(this.name);
}

enum MxDeviceLocation {
  unknown('Unknown'),
  onPremise('OnPremise'),
  offPremise('OffPremise'),
  homePc('HomePc'),
  voiceAru('VoiceAru'),
  onPremiseHomePc('OnPremiseHomePc'),
  recurring('Recurring');

  final String name;
  const MxDeviceLocation(this.name);
}

enum MxPanCaptureMethod {
  manual('Manual'),
  swipe('Swipe'),
  chip('Chip'),
  contactlessSwipe('ContactlessSwipe'),
  contactlessChip('ContactlessChip'),
  fallback('Fallback'),
  contactlessMobile('ContactlessMobile');

  final String name;
  const MxPanCaptureMethod(this.name);
}

enum MxPartialApprovalSupport {
  notSupported('NotSupported'),
  supported('Supported'),
  merchandiseOnly('MerchandiseOnly'),
  cashOnly('CashOnly'),
  exclusive('Exclusive');

  final String name;
  const MxPartialApprovalSupport(this.name);
}

enum MxPaymentResponseStatus {
  any('Any'),

  /// Authorized
  approved('Approved'),
  declined('Declined'),
  settled('Settled'),
  voided('Voided'),
  chargedBack('Chargedback'),

  /// Offline
  ticketOnly('TicketOnly'),

  /// Hold
  authOnly('AuthOnly'),
  inProgress('InProgress');

  final String name;
  const MxPaymentResponseStatus(this.name);
}

enum MxFilterDateType {
  any('Any'),
  today('Today'),
  yesterday('Yesterday'),
  weekToDate('WeekToDate'),
  monthToDate('MonthToDate'),
  last7('Last7'),
  last30('Last30'),
  custom('Custom');

  final String name;
  const MxFilterDateType(this.name);
}
