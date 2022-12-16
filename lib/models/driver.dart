import 'package:cloud_firestore/cloud_firestore.dart';

class Driver {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "email_driver": snapshot['email_driver'],
      "jml_koin_driver": snapshot['jml_koin_driver'],
      "name_driver": snapshot['name_driver'],
      "phone_num_driver": snapshot['phone_num_driver'],
    };
    return data;
  }
}