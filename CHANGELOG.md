## 0.0.1-beta.6

### ✨ New Features
* **Customer Management Service**: Added comprehensive customer management with the following capabilities:
  - `create()` - Create new customers with detailed information
  - `get()` - Retrieve customers with filtering and pagination
  - `getACustomer()` - Get specific customer by ID
  - `update()` - Update existing customer information
  - `createAddress()` - Create customer addresses
  - `getAddress()` - Retrieve customer addresses
  - `updateAddress()` - Update customer addresses
  - `addNote()` - Add customer notes
  - `getNote()` - Retrieve customer notes
  - `getPayments()` - Get customer payment history
* **Enhanced Customer Models**: Added complete set of customer management models including:
  - `MxCreateCustomerRequestModel` - Request model for creating customers
  - `MxCreateCustomerResponseModel` - Response model for customer creation
  - `MxGetCustomerRequestModel` - Request model for retrieving customers
  - `MxGetCustomerResponseModel` - Response model for customer retrieval
  - `MxCreateCustomerAddressRequestModel` - Request model for customer addresses
  - `MxCreateCustomerAddressResponseModel` - Response model for customer addresses
  - `MxCustomerNoteModel` - Model for customer notes
  - `MxCustomerPaymentResponseModel` - Model for customer payments
* **Service Integration**: Customer management service fully integrated into main MxMerchant class
* **Example App Enhancement**: Added Customer Management tab to demonstration app with complete workflow examples
* **Documentation Updates**: Updated README.md with comprehensive Customer Management usage examples and API reference

### 🔧 Improvements
* **Enhanced Error Handling**: Improved service response and error handling across all services
* **Payment API Testing**: Comprehensive testing and validation of payment API functionality
* **Service Reliability**: Enhanced service implementations with better error handling and response management
* **Code Quality**: Improved code structure and reliability across all service implementations

## 0.0.1-beta.5

### ✨ New Features
* **Customer Custom Field Service**: Added comprehensive customer custom field management with the following capabilities:
  - `create()` - Create new custom fields for customers with various data types
  - `get()` - Retrieve custom fields for specific customers
  - `delete()` - Delete custom fields by ID
* **Enhanced Customer Models**: Added complete set of customer custom field models including:
  - `MxCreateCustomFieldRequestModel` - Request model for creating custom fields
  - `MxCreateCustomFieldResponseModel` - Response model for custom field creation
  - `MxGetCustomFieldResponseModel` - Response model for retrieving customer custom fields
  - `MxCustomFieldOptionModel` - Model for custom field options
* **Service Integration**: Customer custom field service fully integrated into main MxMerchant class
* **Example App Enhancement**: Added Customer Custom Fields tab to demonstration app with complete workflow examples
* **Documentation Updates**: Updated README.md with comprehensive Customer Custom Field usage examples and API reference

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