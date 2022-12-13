import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  Map<String, dynamic> snap(DocumentSnapshot snapshot) {
    var data = {
      "alamat": snapshot['alamat'],
      "kecamatan": snapshot['kecamatan'],
      "kota": snapshot['kota'],
      "kode_pos": snapshot['kode_pos'],
      "uid": snapshot['id_user'],
    };
    return data;
  }
}
