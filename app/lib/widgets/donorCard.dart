import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonorCard extends StatefulWidget {
  DonorCard({
    this.id,
    this.phone,
    this.zipcode,
    this.bloodGroup,
    this.recoveredOn,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  final int id;
  final String phone;
  final String zipcode;
  final String bloodGroup;
  final DateTime recoveredOn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String url;
  @override
  _DonorCardState createState() => _DonorCardState();
}

class _DonorCardState extends State<DonorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.25),
              blurRadius: 8.0,
              spreadRadius: 0.5,
              offset: Offset(
                2.0,
                10.0,
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.orangeAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    'Phone Number: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    widget.phone,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Pin Code: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    widget.zipcode,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Blood Group: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    widget.bloodGroup,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Recovery Date: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    DateFormat.yMMMd().format(widget.recoveredOn),
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
