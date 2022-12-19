import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "id_address": snapshot.id.toString(),
      "address": snapshot['address'],
      "district": snapshot['district'],
      "city": snapshot['city'],
      "postal_code": snapshot['postal_code'],
      "uid": snapshot['id_user'],
    };
    return data;
  }
}
