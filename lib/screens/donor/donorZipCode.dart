import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:plasmaConnect/screens/donor/donorCalendar.dart';

class DonorZipCode extends StatefulWidget {
  final String phoneNumber;
  final String bloodGroup;
  DonorZipCode({this.phoneNumber, this.bloodGroup});
  @override
  _DonorZipCodeState createState() => _DonorZipCodeState();
}

String zipCode;

class _DonorZipCodeState extends State<DonorZipCode> {
  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Pin Code not valid',
      message: 'Please enter a valid Pin Code with 6 digits',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 10),
    )..show(context);
  }

  @override
  void initState() {
    zipCode = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
        title: Text(
          'Donor',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please enter your',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pin Code to proceed',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  onChanged: (String value) {
                    setState(() {
                      zipCode = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Pin Code",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      if (zipCode == null || zipCode.length != 6) {
                        showInfoFlushbar(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonorCalendar(
                              phoneNumber: widget.phoneNumber,
                              zipCode: zipCode,
                              bloodGroup: widget.bloodGroup,
                            ),
                          ),
                        );
                      }
                    },
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
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.deepOrangeAccent[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
