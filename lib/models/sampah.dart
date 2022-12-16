import 'package:cloud_firestore/cloud_firestore.dart';

class Sampah {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "berat1": snapshot['berat1'],
      "berat2": snapshot['berat2'],
      "berat3": snapshot['berat3'],
      "berat4": snapshot['berat4'],
    };
    return data;
  }
}
