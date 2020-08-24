import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:plasmaConnect/screens/recipient/recipientZipCode.dart';

class RecipientBloodGroup extends StatefulWidget {
  final String phoneNumber;
  RecipientBloodGroup(this.phoneNumber);
  @override
  _RecipientBloodGroupState createState() => _RecipientBloodGroupState();
}

int _radioValue;
String choosenBloodGroup = "";

class _RecipientBloodGroupState extends State<RecipientBloodGroup> {
  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Blood Group not valid',
      message: 'Please select a valid Blood Group',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 10),
    )..show(context);
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 0:
          choosenBloodGroup = 'A+';
          break;
        case 1:
          choosenBloodGroup = 'A-';
          break;
        case 2:
          choosenBloodGroup = 'B+';
          break;
        case 3:
          choosenBloodGroup = 'B-';
          break;
        case 4:
          choosenBloodGroup = 'AB+';
          break;
        case 5:
          choosenBloodGroup = 'AB-';
          break;
        case 6:
          choosenBloodGroup = 'O+';
          break;
        case 7:
          choosenBloodGroup = 'O-';
          break;
      }
    });
  }

  @override
  void initState() {
    choosenBloodGroup = "";
    _radioValue = 40;
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
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
        title: Text(
          'Plasma Recipient',
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
                      'Please select your',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Blood Group to proceed',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'A +ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'A -ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'B +ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 3,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'B -ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 4,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'AB+ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 5,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'AB-ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 6,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'O +ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Radio(
                              value: 7,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          Text(
                            'O -ve',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      if (choosenBloodGroup != "" || _radioValue < 8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipientZipCode(
                              phoneNumber: widget.phoneNumber,
                              bloodGroup: choosenBloodGroup,
                            ),
                          ),
                        );
                      } else {
                        showInfoFlushbar(context);
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
