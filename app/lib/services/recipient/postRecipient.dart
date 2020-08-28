import 'package:http/http.dart';

Future<String> postRecipient({
  String phone,
  String zipCode,
  String bloodGroup,
  String recoveryDate,
}) async {
  String urlPOSTdonor = 'https://connectruss.herokuapp.com/recipients.json';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''{
      "phone": "$phone",
      "zipcode": "$zipCode",
      "blood_group": "$bloodGroup"
    }''';
  var response = await post(urlPOSTdonor, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  print('POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('Recipient POST successfull');
  } else {
    print('Recipient POST Failed');
  }
  return statusCode;
}
