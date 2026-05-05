import 'package:collection/collection.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxPosDataModel {
  /// Is cardholder present at the time of payment?
  final MxCardHolderPresentEnum? cardholderPresence;

  /// How is the terminal attended.
  final MxDevicePresentEnum? deviceAttendance;

  final MxDeviceInputCapabilityEnum? deviceInputCapability;

  /// Where is terminal located?
  final MxDeviceLocationEnum? deviceLocation;

  /// Method of PAN entry.
  final MxPanCaptureMethodEnum? panCaptureMethod;

  /// Does POS support partial approvals?
  final MxPartialApprovalSupportEnum? partialApprovalSupport;

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
          ? MxCardHolderPresentEnum.values.firstWhereOrNull((e) => e.name == json['cardholderPresence'])
          : null,
      deviceAttendance: json['deviceAttendance'] != null
          ? MxDevicePresentEnum.values.firstWhereOrNull((e) => e.name == json['deviceAttendance'])
          : null,
      deviceInputCapability: json['deviceInputCapability'] != null
          ? MxDeviceInputCapabilityEnum.values.firstWhereOrNull((e) => e.name == json['deviceInputCapability'])
          : null,
      deviceLocation: json['deviceLocation'] != null ? MxDeviceLocationEnum.values.firstWhereOrNull((e) => e.name == json['deviceLocation']) : null,
      panCaptureMethod: json['panCaptureMethod'] != null
          ? MxPanCaptureMethodEnum.values.firstWhereOrNull((e) => e.name == json['panCaptureMethod'])
          : null,
      partialApprovalSupport: json['partialApprovalSupport'] != null
          ? MxPartialApprovalSupportEnum.values.firstWhereOrNull((e) => e.name == json['partialApprovalSupport'])
          : null,
      pinCaptureCapability: json['pinCaptureCapability'],
    );
  }
}
