import 'package:flutter/material.dart';
import 'package:connectruss/models/donorModel.dart';
import 'package:connectruss/widgets/donorCard.dart';

class RecipientSuccessPage extends StatefulWidget {
  final List<Donor> donor;
  RecipientSuccessPage(this.donor);
  @override
  _RecipientSuccessPageState createState() => _RecipientSuccessPageState();
}

class _RecipientSuccessPageState extends State<RecipientSuccessPage> {
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
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: widget.donor.length != 0
            ? ListView.builder(
                itemCount: widget.donor.length,
                itemBuilder: (context, index) {
                  return DonorCard(
                    phone: widget.donor[index].phone,
                    bloodGroup: widget.donor[index].bloodGroup,
                    zipcode: widget.donor[index].zipcode,
                    recoveredOn: widget.donor[index].recoveredOn,
                  );
                },
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sorry, There are no donors with the selected blood group.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
