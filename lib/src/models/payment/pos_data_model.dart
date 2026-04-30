import 'package:collection/collection.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxPosDataModel {
  /// Is cardholder present at the time of payment?
  final MxCardHolderPresent? cardholderPresence;

  /// How is the terminal attended.
  final MxDevicePresent? deviceAttendance;

  final MxDeviceInputCapability? deviceInputCapability;

  /// Where is terminal located?
  final MxDeviceLocation? deviceLocation;

  /// Method of PAN entry.
  final MxPanCaptureMethod? panCaptureMethod;

  /// Does POS support partial approvals?
  final MxPartialApprovalSupport? partialApprovalSupport;

  /// PIN capture capability of device.
  /// For Terminals, send the maximum amount of digits the terminal supports.
  final String? pinCaptureCapability;

  const MxPosDataModel({
    this.cardholderPresence,
    this.deviceAttendance,
    this.deviceInputCapability,
    this.deviceLocation,
    this.panCaptureMethod,
    this.partialApprovalSupport,
    this.pinCaptureCapability,
  });

  Map<String, dynamic> toJson() => {
    'cardholderPresence': cardholderPresence?.name,
    'deviceAttendance': deviceAttendance?.name,
    'deviceInputCapability': deviceInputCapability?.name,
    'deviceLocation': deviceLocation?.name,
    'panCaptureMethod': panCaptureMethod?.name,
    'partialApprovalSupport': partialApprovalSupport?.name,
    'pinCaptureCapability': pinCaptureCapability,
  }..removeWhere((_, value) => value == null);

  factory MxPosDataModel.fromJson(Map<String, dynamic> json) {
    return MxPosDataModel(
      cardholderPresence: json['cardholderPresence'] != null
          ? MxCardHolderPresent.values.firstWhereOrNull((e) => e.name == json['cardholderPresence'])
          : null,
      deviceAttendance: json['deviceAttendance'] != null ? MxDevicePresent.values.firstWhereOrNull((e) => e.name == json['deviceAttendance']) : null,
      deviceInputCapability: json['deviceInputCapability'] != null
          ? MxDeviceInputCapability.values.firstWhereOrNull((e) => e.name == json['deviceInputCapability'])
          : null,
      deviceLocation: json['deviceLocation'] != null ? MxDeviceLocation.values.firstWhereOrNull((e) => e.name == json['deviceLocation']) : null,
      panCaptureMethod: json['panCaptureMethod'] != null
          ? MxPanCaptureMethod.values.firstWhereOrNull((e) => e.name == json['panCaptureMethod'])
          : null,
      partialApprovalSupport: json['partialApprovalSupport'] != null
          ? MxPartialApprovalSupport.values.firstWhereOrNull((e) => e.name == json['partialApprovalSupport'])
          : null,
      pinCaptureCapability: json['pinCaptureCapability'],
    );
  }
}
