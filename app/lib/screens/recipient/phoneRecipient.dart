import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:plasmaConnect/screens/recipient/recipientBloodGroup.dart';

class EnterPhoneNumberRecipient extends StatefulWidget {
  @override
  _EnterPhoneNumberRecipientState createState() =>
      _EnterPhoneNumberRecipientState();
}

String recipientPhoneNumber;

class _EnterPhoneNumberRecipientState extends State<EnterPhoneNumberRecipient> {
  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Phone Number not valid',
      message: 'Please enter a valid Phone Number',
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
    recipientPhoneNumber = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipient',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
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
                      'Phone number to proceed',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    onChanged: (String value) {
                      setState(() {
                        recipientPhoneNumber = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Phone number",
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
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amberAccent[100],
                        border: Border.all(color: Colors.amber),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Terms and Conditions',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Text(
                              'By clicking here, you agree to not misuse the donors data and all the information furnished is true to the best of your knowledge and belief.',
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () {
                          if (recipientPhoneNumber == null ||
                              recipientPhoneNumber.length != 10) {
                            showInfoFlushbar(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipientBloodGroup(recipientPhoneNumber),
                              ),
                            );
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
