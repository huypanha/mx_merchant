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