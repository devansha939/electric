import "package:electric/models/billData.dart";
import "package:electric/models/user.dart";
import "package:electric/resources/AuthMethods.dart";
import "package:electric/resources/changingDatabase.dart";
import "package:electric/widgets/text_Field.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class AddDataScreen extends StatefulWidget {
  final String userId;
  final String houseNumber;
  const AddDataScreen(
      {Key? key, required this.userId, required this.houseNumber})
      : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

Widget TextF(String hintText, TextEditingController controller, bool editable) {
  return TextField(
    enabled: editable,
    controller: controller,
    decoration: InputDecoration(
      labelText: hintText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController _consumerNameController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _meterNumberController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  late DateTime _startDate ;
  bool selectedStart = false;
  bool selectedEnd = false;
  late DateTime _endDate ;

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _numberOfDaysController = TextEditingController();
  TextEditingController _previousReadingController = TextEditingController();
  TextEditingController _currentReadingController = TextEditingController();
  TextEditingController _totalUnitsConsumedController = TextEditingController();
  TextEditingController _energyChargeController = TextEditingController();
  TextEditingController _meterRentController = TextEditingController();
  TextEditingController _gstController = TextEditingController();
  TextEditingController _totalAmountController = TextEditingController();
  TextEditingController _netPayableController = TextEditingController();
  TextEditingController _dateOfIssueController = TextEditingController();
  Future addData() async {
    try {
      // Add data to the database
      await addUserData(widget.userId, BillData.fromJson({
        'consumerName': _consumerNameController.text,
        'houseNumber': _houseNumberController.text,
        'meterNumber': _meterNumberController.text,
        'type': _typeController.text,
        'startDate': _startDateController.text,
        'endDate': _endDateController.text,
        'numberOfDays': _numberOfDaysController.text,
        'previousReading': _previousReadingController.text,
        'currentReading': _currentReadingController.text,
        'totalUnitsConsumed': _totalUnitsConsumedController.text,
        'energyCharge': _energyChargeController.text,
        'meterRent': _meterRentController.text,
        'gst': _gstController.text,
        'totalAmount': _totalAmountController.text,
        'netPayable': _netPayableController.text,
        'dateOfIssue': _dateOfIssueController.text,
      }));
      return true;
    } catch (e) {
      print("Error adding data: $e");
      throw e;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: 
      
        // heading saying adding new bill to house number ${widget.houseNumber}
        // SizedBox(
        //   height: 20,
        //   child: Text(
        //     'Adding new bill to house number ${widget.houseNumber}',
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //     softWrap: true, // Add this line to allow text to wrap
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextF('Consumer Name', _consumerNameController, true),
              SizedBox(
                height: 10,
              ),
              // TField(hText: "batman", controller: _consumerNameController),
              TextF(
                'House Number: ${widget.houseNumber}',
                _houseNumberController,
                false,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Meter Number',
                _meterNumberController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Type',
                _typeController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              // TextF(
              //   'Start Date',
              //   _startDateController,
              //   true,
              // ),
              ElevatedButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                print('Selected date: $pickedDate');
                // Here you can assign pickedDate to your variable
                setState(() {
                  _startDate = pickedDate;
                  selectedStart=true;
                });
              }
            },
            child: Text(selectedStart?"${_startDate.toString()}":'Select Start Date'),
          ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                print('Selected date: $pickedDate');
                // Here you can assign pickedDate to your variable
                setState(() {
                  _endDate = pickedDate;
                  selectedEnd=true;
                });
              }
            },
            child: Text(selectedEnd?"${_endDate.toString()}":'Select End Date'),
          ),
              // TextF(
              //   'End Date',
              //   _endDateController,
              //   true,
              // ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Number of Days',
                _numberOfDaysController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Previous Reading',
                _previousReadingController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Current Reading',
                _currentReadingController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Total Units Consumed',
                _totalUnitsConsumedController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Energy Charge',
                _energyChargeController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Meter Rent',
                _meterRentController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'GST',
                _gstController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Total Amount',
                _totalAmountController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Net Payable',
                _netPayableController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              TextF(
                'Date of Issue',
                _dateOfIssueController,
                true,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    addData();
                    // Add data to the database

                  },
                  child: const Text('Add Data'),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
    );
  }
}
