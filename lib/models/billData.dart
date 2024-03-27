
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
}
