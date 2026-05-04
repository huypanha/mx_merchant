import '../../utils/enums.dart';
import 'create_customer_custom_field_model.dart';

class MxCreateCustomerRequestModel {
  /// Customer's full name (display name)
  final String name;

  /// Customer's first name
  final String firstName;

  /// Customer's last name
  final String? lastName;

  /// Street address
  final String? address1;

  /// Apartment, suite, department
  final String? address2;

  /// City
  final String? city;

  /// State
  final String? state;

  /// Zip code
  final String? zip;

  /// Name for address, i.e. home, work
  final String? addressName;

  /// Type of customer
  final MxCustomerType customerType;

  /// Customer's email address
  final String? email;

  /// Customer's cell phone number
  final String? mobile;

  /// Customer's phone number
  final String? phone;

  /// Client provided customer number
  final String? number;

  /// Is this customer tax exempt?
  final bool isTaxExempt;

  /// Customer's SSN or EIN (9 digits) (Required for tax exempt customers)
  final String? taxId;

  /// Customer's spend profile
  final String? spendProfile;

  /// Client-defined custom fields. Must be set up prior to use
  final List<MxCustomerCustomFieldModel>? customFields;

  /// Is the customer active?
  final bool activeStatus;

  /// Spend profile selected for customer
  final String? selectedSpendProfile;

  /// If the spend profile was selected or sent manually, this would be true.
  final bool spendProfileOverride;

  /// If you would like to get the response object, you should supply `echo = true` as a URL parameter.
  /// This is useful as it keeps the user from having to use a GET call to see the response object information.
  final bool echo;

  MxCreateCustomerRequestModel({
    required this.name,
    required this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.addressName,
    this.customerType = .person,
    this.email,
    this.mobile,
    this.phone,
    this.number,
    this.isTaxExempt = false,
    this.taxId,
    this.spendProfile,
    this.customFields,
    this.activeStatus = true,
    this.selectedSpendProfile,
    this.spendProfileOverride = false,
    this.echo = true,
  });

  Map<String, dynamic> toBodyJson() {
    return {
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'zip': zip,
      'addressName': addressName,
      'customerType': customerType.name,
      'email': email,
      'mobile': mobile,
      'phone': phone,
      'number': number,
      'isTaxExempt': isTaxExempt,
      'taxId': taxId,
      'spendProfile': spendProfile,
      'customFields': customFields?.map((e) => e.toJson()).toList(),
      'activeStatus': activeStatus,
      'selectedSpendProfile': selectedSpendProfile,
      'spendProfileOverride': spendProfileOverride,
    }..removeWhere((_, v) => v == null);
  }

  Map<String, dynamic> toQueryJson() {
    return {'echo': echo};
  }
}
