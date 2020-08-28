import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent[100],
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(
                    color: Color(0xFFA60303),
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'connec',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          color: Color(0xFFA60303),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'russ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: HomeScreen(),
      ),
    );
  }
}
