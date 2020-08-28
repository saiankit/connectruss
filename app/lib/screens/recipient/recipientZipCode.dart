import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:connectruss/models/donorModel.dart';
import 'package:connectruss/screens/recipient/recipientSuccessPage.dart';
import 'package:connectruss/services/donor/findDonors.dart';
import 'package:connectruss/services/recipient/postRecipient.dart';

class RecipientZipCode extends StatefulWidget {
  final String phoneNumber;
  final String bloodGroup;
  RecipientZipCode({this.phoneNumber, this.bloodGroup});
  @override
  _RecipientZipCodeState createState() => _RecipientZipCodeState();
}

String zipCode;

class _RecipientZipCodeState extends State<RecipientZipCode> {
  bool loading = true;
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
      duration: Duration(seconds: 6),
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
          'Recipient',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: loading
            ? Container(
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
                              setState(() {
                                loading = false;
                              });
                              postRecipient(
                                phone: widget.phoneNumber,
                                bloodGroup: widget.bloodGroup,
                                zipCode: zipCode,
                              ).then((value) {
                                getDonorsNearby(
                                  bloodGroup: widget.bloodGroup,
                                ).then(
                                  (value) {
                                    print(value.length);
                                    List<Donor> list = [];
                                    for (var i = 0; i < value.length; i++) {
                                      Donor res = donorGetFromJson(value[i]);
                                      list.add(res);
                                    }
                                    return list;
                                  },
                                ).then((value) {
                                  setState(() {
                                    loading = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipientSuccessPage(value),
                                    ),
                                  );
                                });
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.25),
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
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Searching Donors that match your blood group',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Transform.scale(
                    scale: 2.0,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
      ),
    );
  }
}
