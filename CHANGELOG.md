## 0.0.1-beta.7

### 💥 Breaking Changes
* **Customer Custom Fields**: Removed `echo` parameter from `MxCreateCustomFieldRequestModel` as it is now internally handled.
* **Customer Custom Fields**: `get()` method in custom field service now uses GET request instead of POST.

### ✨ New Features
* **Customer Custom Fields**: Added `options` parameter support to `MxCreateCustomFieldRequestModel` for creating fields with predefined options.

### 🐛 Bug Fixes
* **Error Handling**: Improved error parsing to support uppercase `Message` key in API responses.
* **Customer Custom Fields**: Fixed `options` serialization in `MxCreateCustomFieldResponseModel`.
* **Customer Custom Fields**: Fixed type casting errors in `fromJsonArray` for custom field response models.
* **Customer Custom Fields**: Fixed `delete()` method to correctly expect `204 No Content` HTTP status instead of `200 OK`.

### 📝 Documentation
* **README**: Updated Customer Custom Fields example to demonstrate the usage of `options`.
* **README**: Fixed undefined variable usage in the custom field delete example.

## 0.0.1-beta.6

### 💥 Breaking Changes
* **Customer Service**: `update()` now returns `Future<bool>` instead of `Future<MxCreateCustomerResponseModel>`.
* **Customer Service**: `updateAddress()` now returns `Future<bool>` instead of `Future<MxCreateCustomerAddressResponseModel>`.
* **Customer Service**: `createAddress()` now returns a single `Future<MxCreateCustomerAddressResponseModel>` instead of a list.

### ✨ New Features
* **Customer Models**: Added `copyWith()` and `toRequestModel()` methods to `MxCreateCustomerResponseModel` and `MxCreateCustomerAddressResponseModel` to simplify updating customer records and addresses.
* **Customer Models**: Added `email`, `mobile`, `phone`, `customFields`, and `selectedSpendProfile` to `MxCreateCustomerResponseModel`.
* **Customer Models**: Added `spendProfileOverride` field to `MxGetCustomerRecordModel`.

### 🐛 Bug Fixes
* **Customer Models**: Fixed assertion logic in `MxGetCustomerRequestModel` for custom time filters.

### 📝 Documentation
* **README**: Updated Customer Management examples to match the actual example app usage, including `name` and `activeStatus` fields in customer creation
* **README**: Updated customer update example to use the `copyWith().toRequestModel()` pattern
* **README**: Added Customer Address management examples (create, get, update)
* **README**: Fixed customer `get()` response to use `records` property instead of direct list access
* **README**: Aligned all Customer and Custom Fields examples with `example/lib/main.dart`

## 0.0.1-beta.5

### ✨ New Features
* **Customer Management Service**: Added comprehensive customer management with CRUD operations, address management, notes, and payment history
* **Customer Models**: Complete set of customer management models for requests and responses
* **Customer Custom Field Service**: Added comprehensive customer custom field management with create, get, and delete operations
* **Enhanced Customer Models**: Complete set of customer custom field models for various data types and options
* **Service Integration**: Customer management and custom field services fully integrated into main MxMerchant class
* **Example App**: Added Customer Management and Custom Fields tabs with complete workflow examples
* **Documentation**: Updated README.md with comprehensive Customer Management and Custom Field usage examples

### 🔧 Improvements
* **Enhanced Error Handling**: Improved service response and error handling across all services
* **API Testing**: Comprehensive testing and validation of payment API functionality
* **Service Reliability**: Enhanced service implementations with better error handling
* **Terminal Transaction API**: Updated delete method to `deleteQueued()`
* **Example App**: 
  - Added comprehensive tabbed interface with Material 3 design
  - Real-time API response display with copy-to-clipboard functionality
  - Enhanced error handling and user feedback
* **Documentation**: Updated README.md transaction flow examples and API method names
* **Authentication**: Enhanced credential management and sandbox environment handling

## 0.0.1-beta.4

### ✨ New Features
* **Terminal Transaction Service**: Added comprehensive terminal transaction management with the following capabilities:
  - `createTransaction()` - Create new terminal transactions with customizable amount, type, and vault card options
  - `updateTransaction()` - Update existing terminal transactions by reference and terminal ID
  - `getTransaction()` - Retrieve transaction details using replay ID
  - `deleteTransaction()` - Delete terminal transactions by terminal ID
* **Enhanced Terminal Models**: Added complete set of terminal transaction models including:
  - `MxTerminalCreateTransactionRequestModel` - Request model for creating transactions
  - `MxTerminalCreateTransactionResponseModel` - Response model with provider and status information
  - `MxTerminalUpdateTransactionRequestModel` - Request model for updating transactions
  - Supporting models for merchant, provider, and payment systems data
* **JWT Authentication Integration**: Terminal transaction service uses JWT authentication for secure API communication
* **Multi-API Support**: Leverages both v1 and v2 MX Merchant APIs for optimal functionality

## 0.0.1-beta.3

* Supported multiple base URLs of MX Merchant API.
* Supported multiple authentication types of MX Merchant API (Basic and JWT).
* Added terminal device service.

## 0.0.1-beta.1

* Initial release.