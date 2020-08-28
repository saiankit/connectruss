import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:connectruss/screens/donor/donorSuccess.dart';
import 'package:connectruss/services/donor/postDonor.dart';

class DonorCalendar extends StatefulWidget {
  final String phoneNumber;
  final String zipCode;
  final String bloodGroup;
  DonorCalendar({
    this.bloodGroup,
    this.phoneNumber,
    this.zipCode,
  });
  @override
  _DonorCalendarState createState() => _DonorCalendarState();
}

class _DonorCalendarState extends State<DonorCalendar> {
  DateTime selectedDate = DateTime.now();
  DateTime visibleDate = DateTime.now();
  bool loading = true;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2201));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        visibleDate = picked;
      });
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
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
        title: Text(
          'Calendar',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
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
                            'Please select the',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Date of Recovery',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            DateFormat.yMMMd().format(visibleDate),
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.25),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Select Date',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              loading = false;
                            });
                            var recoveryDate =
                                selectedDate.toLocal().toString().split(' ')[0];
                            postDonor(
                              phone: widget.phoneNumber,
                              bloodGroup: widget.bloodGroup,
                              zipCode: widget.zipCode,
                              recoveryDate: recoveryDate,
                            ).then(
                              (value) {
                                if (value == '201') {
                                  setState(() {
                                    loading = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DonorSuccessPage(),
                                    ),
                                  );
                                }
                              },
                            );
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
                      'Don\'t refresh. Your data is being added.',
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
