
class BillData {
  String consumerName;
  String houseNumber;
  int meterNumber;
  String type;
  DateTime startDate;
  DateTime endDate;
  int numberOfDays;
  int previousReading;
  int currentReading;
  int totalUnitsConsumed;
  int energyCharge;
  int meterRent;
  int gst;
  int totalAmount;
  int netPayable;
  DateTime dateOfIssue;

  BillData({
    required this.consumerName,
    required this.houseNumber,
    required this.meterNumber,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.numberOfDays,
    required this.previousReading,
    required this.currentReading,
    required this.totalUnitsConsumed,
    required this.energyCharge,
    required this.meterRent,
    required this.gst,
    required this.totalAmount,
    required this.netPayable,
    required this.dateOfIssue,
  });
factory BillData.fromJson(Map<String, dynamic> json) {
    return BillData(
        consumerName: json['consumerName'],
        houseNumber: json['houseNumber'],
        meterNumber: json['meterNumber'],
        type: json['type'],
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']),
        numberOfDays: json['numberOfDays'],
        previousReading: json['previousReading'],
        currentReading: json['currentReading'],
        totalUnitsConsumed: json['totalUnitsConsumed'],
        energyCharge: json['energyCharge'],
        meterRent: json['meterRent'],
        gst: json['gst'],
        totalAmount: json['totalAmount'],
        netPayable: json['netPayable'],
        dateOfIssue: DateTime.parse(json['dateOfIssue']),
    );
}
}
