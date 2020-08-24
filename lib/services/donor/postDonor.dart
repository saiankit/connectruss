import 'package:http/http.dart';

Future<String> postDonor({
  String phone,
  String zipCode,
  String bloodGroup,
  String recoveryDate,
}) async {
  String urlPOSTdonor = 'https://findcovidplasma.herokuapp.com/donors.json';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''{
      "phone": "$phone",
      "zipcode": "$zipCode",
      "blood_group": "$bloodGroup",
      "recovered_on": "$recoveryDate"
    }''';
  var response = await post(urlPOSTdonor, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  print('Donor POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('Donor POST successfull');
  } else {
    print('Donor POST Failed');
  }
  return statusCode;
}
