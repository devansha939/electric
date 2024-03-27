import "package:electric/models/billData.dart";
import "package:flutter/material.dart";

class User {
  String email;
  String? houseNumber;
  String userType;
  List<BillData>? data;
  String? otp;
  DateTime? otpExpiry;
  String id;

  User({
    required this.id,
    required this.email,
    this.houseNumber,
    required this.userType,
    this.data,
    this.otp,
    this.otpExpiry,
  });

  // void addBillData(BillData newBillData) {
  //   data.add(newBillData);
  // }
  // factory User.fromSnap(DocumentSnapshot snap) {
  //   return User(
  //     id: snap['uid'],
  //     email: snap['mailId'],
  //     userType: snap['name'],
  //     houseNumber: snap['houseId'],
  //   );
  // }
}
