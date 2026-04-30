class MxTerminalEntryModeModel {
  final bool swipe;
  final bool insert;
  final bool tap;
  final bool pinPad;

  MxTerminalEntryModeModel({this.swipe = true, this.insert = true, this.tap = true, this.pinPad = true});

  Map<String, dynamic> toJson() {
    return {'swipe': swipe, 'insert': insert, 'tap': tap, 'pinpad': pinPad};
  }
}
