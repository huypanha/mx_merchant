enum MxMerchantEnvironmentEnum { sandbox, production }

enum MxBankAccountTypeEnum {
  checking('Checking'),
  savings('Savings');

  final String name;
  const MxBankAccountTypeEnum(this.name);
}

enum MxCustomerTypeEnum {
  person('Person'),
  business('Business');

  final String name;
  const MxCustomerTypeEnum(this.name);
}

enum MxPaymentTransactionTypeEnum {
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
  refund('Refund'),
  balance('Balance');

  final String name;
  const MxPaymentTransactionTypeEnum(this.name);
}

enum MxPaymentTenderTypeEnum {
  any('Any'),
  card('Card'),
  check('Check'),
  cash('Cash'),
  multiple('Multiple'),
  loyalty('Loyalty'),
  ach('ACH');

  final String name;
  const MxPaymentTenderTypeEnum(this.name);
}

enum MxPaymentEntryClassEnum {
  ccd('CCD'),
  ppd('PPD'),
  tel('TEL'),
  web('WEB');

  final String name;
  const MxPaymentEntryClassEnum(this.name);
}

enum MxPaymentSourceEnum {
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
  const MxPaymentSourceEnum(this.name);
}

enum MxCardHolderPresentEnum {
  unknown('Unknown'),
  present('Present'),
  notPresent('NotPresent'),
  mail('Mail'),
  phone('Phone'),
  standing('Standing'),
  recurring('Recurring'),
  ecom('Ecom');

  final String name;
  const MxCardHolderPresentEnum(this.name);
}

enum MxDevicePresentEnum {
  unknown('Unknown'),
  attended('Attended'),
  homePc('HomePc'),
  voiceAru('VoiceAru'),
  recurring('Recurring'),
  unattended('Unattended');

  final String name;
  const MxDevicePresentEnum(this.name);
}

enum MxDeviceInputCapabilityEnum {
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
  const MxDeviceInputCapabilityEnum(this.name);
}

enum MxDeviceLocationEnum {
  unknown('Unknown'),
  onPremise('OnPremise'),
  offPremise('OffPremise'),
  homePc('HomePc'),
  voiceAru('VoiceAru'),
  onPremiseHomePc('OnPremiseHomePc'),
  recurring('Recurring');

  final String name;
  const MxDeviceLocationEnum(this.name);
}

enum MxPanCaptureMethodEnum {
  manual('Manual'),
  swipe('Swipe'),
  chip('Chip'),
  contactlessSwipe('ContactlessSwipe'),
  contactlessChip('ContactlessChip'),
  fallback('Fallback'),
  contactlessMobile('ContactlessMobile');

  final String name;
  const MxPanCaptureMethodEnum(this.name);
}

enum MxPartialApprovalSupportEnum {
  notSupported('NotSupported'),
  supported('Supported'),
  merchandiseOnly('MerchandiseOnly'),
  cashOnly('CashOnly'),
  exclusive('Exclusive');

  final String name;
  const MxPartialApprovalSupportEnum(this.name);
}

enum MxPaymentResponseStatusEnum {
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
  const MxPaymentResponseStatusEnum(this.name);
}

enum MxFilterDateTypeEnum {
  any('Any'),
  today('Today'),
  yesterday('Yesterday'),
  weekToDate('WeekToDate'),
  monthToDate('MonthToDate'),
  last7('Last7'),
  last30('Last30'),
  custom('Custom');

  final String name;
  const MxFilterDateTypeEnum(this.name);
}

enum MxAuthTokenEnum { basic, jwt }

enum MxBaseUrlVersionEnum { v1, v2 }

enum MxCustomFieldDataTypeEnum {
  string('String'),
  integer('Integer'),
  boolean('Boolean'),
  decimal('Decimal'),
  list('List');

  final String name;
  const MxCustomFieldDataTypeEnum(this.name);
}

enum MxDurationOptionEnum {
  lifetime('Lifetime'),
  month('Month'),
  week('Week'),
  yesterday('Yesterday'),
  today('Today'),
  last30('Last30'),
  last7('Last7'),
  custom('Custom');

  final String name;
  const MxDurationOptionEnum(this.name);
}
