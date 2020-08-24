import 'package:http/http.dart';
import 'dart:convert';

String encodeQeuery(String bloodGroup) {
  var length = bloodGroup.split('').length;
  String neg = bloodGroup.split('')[length - 1];
  String encodedNegation;
  if (neg == '+') {
    encodedNegation = 'B';
  } else {
    encodedNegation = 'D';
  }
  String finalS;
  if (length == 2) {
    finalS = bloodGroup.split('')[0];
  } else {
    finalS = bloodGroup.split('')[0] + bloodGroup.split('')[1];
  }
  return finalS + '%2' + encodedNegation;
}

Future<List<dynamic>> getDonorsNearby({String bloodGroup}) async {
  String encodedQuery = encodeQeuery(bloodGroup);
  String urlGETdonor =
      'https://findcovidplasma.herokuapp.com/donors.json?blood_group=$encodedQuery';
  Map<String, String> headers = {"Content-type": "application/json"};
  var response = await get(
    urlGETdonor,
    headers: headers,
  );
  String statusCode = response.statusCode.toString();
  List<dynamic> responseList = json.decode(response.body);

  print('POST request Status Code : ' + statusCode);
  if (statusCode == '200') {
    print('Donor GET successfull');
  } else {
    print('Donor GET Failed');
  }
  return responseList;
}
