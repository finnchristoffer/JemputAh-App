import 'package:cloud_firestore/cloud_firestore.dart';

class Jemput {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "id_jemput": snapshot.id.toString(),
      "id_driver": snapshot['id_driver'],
      "id_sampah": snapshot['id_sampah'],
      "id_user": snapshot['id_user'],
      "time_code": snapshot['time_code'],
      "total_berat": snapshot['total_berat'],
      "total_koin_driver": snapshot["total_koin_driver"],
      "total_koin_user": snapshot["total_koin_user"],
      "date": snapshot["date"],
      "done": snapshot["done"],
      "address": snapshot['address'],
    };
    return data;
  }
}
