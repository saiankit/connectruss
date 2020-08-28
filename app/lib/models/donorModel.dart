// To parse this JSON data, do
//
//     final donor = donorFromJson(jsonString);

import 'dart:convert';

Donor donorFromJson(String str) => Donor.fromJson(json.decode(str));
Donor donorGetFromJson(Map<String, dynamic> str) => Donor.fromJson(str);

String donorToJson(Donor data) => json.encode(data.toJson());

class Donor {
  Donor({
    this.id,
    this.phone,
    this.zipcode,
    this.bloodGroup,
    this.recoveredOn,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  int id;
  String phone;
  String zipcode;
  String bloodGroup;
  DateTime recoveredOn;
  DateTime createdAt;
  DateTime updatedAt;
  String url;

  factory Donor.fromJson(Map<String, dynamic> json) => Donor(
        id: json["id"],
        phone: json["phone"],
        zipcode: json["zipcode"],
        bloodGroup: json["blood_group"],
        recoveredOn: DateTime.parse(json["recovered_on"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "zipcode": zipcode,
        "blood_group": bloodGroup,
        "recovered_on":
            "${recoveredOn.year.toString().padLeft(4, '0')}-${recoveredOn.month.toString().padLeft(2, '0')}-${recoveredOn.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
      };
}
